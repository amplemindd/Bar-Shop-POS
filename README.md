# Bar Shop POS - Localhost Edition

A local-only Bar Shop POS adapted from the uploaded Perkleaf POS project. It uses:

- React.js with Create React App (no Vite)
- Native Node.js HTTP backend (no Express.js)
- MySQL database
- JWT authentication

## Requirements

- Windows 10/11
- Node.js LTS (includes npm)
- MySQL Server and MySQL Workbench

## Quick setup

1. Extract this ZIP to a normal folder, for example `C:\BarShopPOS`.
2. Double-click `setup-local.bat` (internet is needed once to install npm packages).
3. Open MySQL Workbench and run the SQL in `database/bar_shop_pos.sql`.
4. Open `backend-node/.env` and set:
   - `DB_PASSWORD` to your MySQL root password.
   - `JWT_SECRET` to a long, random private string.
   - Change `ADMIN_PASSWORD` from the sample value.
5. Double-click `run-local.bat`.
6. Open `http://localhost:3000`.

The backend health check is `http://localhost:5000/api/health`.

## Default first admin login

- Email: `admin@barshop.local`
- Password: `ChangeMe123!`

Change the password in `backend-node/.env` before first launch. The admin user is created during the first database migration. If the database already contains users, use the existing account.

## Bar Shop configuration

On a fresh database, the system creates starter categories: Whisky, Beer, Rum, Vodka, Wine, Brandy, Gin and Other. No alcohol products, prices, tax rates or stock quantities are fabricated. Add the products, bottle sizes, MRP, purchase cost and opening stock from the admin panel.

Dine-in and delivery are disabled by default; pickup is enabled. You can change settings in the admin panel if your business model requires them. The project retains table/order modules from its source project, but the default setup is aimed at retail counter billing.

## Important tax / legal setup

Alcohol excise and tax treatment varies by state, product and licence. The fresh database starts with a zero-rate placeholder only; configure the correct applicable duties/taxes and billing requirements with your local excise/tax advisor before issuing real customer invoices. This software does not provide a liquor licence or determine legal eligibility to sell.

## Local-only behavior

The backend binds to `127.0.0.1`, so it is available only on this computer. It is not configured for LAN, Render, or public hosting. Do not expose it to the internet without a separate security and deployment review.

## GitHub

Create a new empty GitHub repository and push this folder as a separate project. Do not commit `backend-node/.env`, `node_modules`, database backups, or real customer data. `.gitignore` already excludes local secrets and dependencies.

## Troubleshooting

- `Access denied for user`: correct `DB_USER` / `DB_PASSWORD` in `backend-node/.env`.
- `Unknown database`: run `database/bar_shop_pos.sql` in MySQL Workbench.
- `Cannot connect to server`: keep both backend and frontend terminal windows open.
- Port already in use: stop the other local app using port 3000 or 5000.
