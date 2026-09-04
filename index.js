import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import axios from "axios";

const app = express();
const port = process.env.PORT || 3000;

const db = new pg.Client({
    user: process.env.DB_USER || "postgres",
    host: process.env.DB_HOST || "localhost",
    database: process.env.DB_NAME || "countries",
    password: process.env.DB_PASSWORD,
    port: Number(process.env.DB_PORT) || 5432,
});

db.connect()
    .then(() => console.log("Database is connected"))
    .catch((error) => console.error("Database connection error:", error.message));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.set("view engine", "ejs");

app.get("/", (req, res) => {
    res.render("index.ejs", { countryName: "", country: null, error: null });
});

app.post("/search", async (req, res) => {
    const countryName = req.body.nameCountry?.trim() || "";

    try {
        if (!countryName) {
            return res.render("index.ejs", {
                countryName: "", country: null,
                error: "Please enter the name of a country.",
            });
        }

        const result = await db.query(
            "SELECT * FROM nameOfCountries WHERE name ILIKE $1 LIMIT 1",
            [`%${countryName}%`]
        );

        if (result.rows.length === 0) {
            return res.render("index.ejs", {
                countryName, country: null,
                error: `Country "${countryName}" was not found.`,
            });
        }

        const country = result.rows[0];
        let flagURL = null;

        try {
            const apiResponse = await axios.get(
                `https://countries.dev/name/${encodeURIComponent(country.name)}`
            );
            flagURL = apiResponse.data[0]?.flags?.png || null;
        } catch (error) {
            console.error("Flag fetch failed for:", country.name, "| Status:", error.response?.status || "unknown");
        }

        return res.render("index.ejs", {
            country: { name: country.name, flag: flagURL },
            error: null,
            countryName,
        });
    } catch (error) {
        console.error("Search error:", error.message);
        return res.render("index.ejs", {
            country: null,
            error: "Something went wrong on the server.",
            countryName,
        });
    }
});

app.listen(port, () => console.log(`Server is running on port ${port}`));
