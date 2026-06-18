# InvenTrack – Inventory Management System

A full-featured Inventory Management System built with **JSP + Bootstrap 3**,
deployed on **Apache Tomcat** via a **Jenkins CI/CD pipeline** using **Maven**.

This project replicates the same DevOps workflow taught in class using an
ecommerce website — but with an Inventory Management System instead.

---

## Project Structure

```
newproject-jenkins/
│
├── Jenkinsfile                         ← Jenkins CI/CD pipeline
├── pom.xml                             ← Maven build file (WAR packaging)
│
└── src/
    └── main/
        └── webapp/
            ├── index.jsp               ← Main website (all pages in one file)
            └── WEB-INF/
                └── web.xml             ← Tomcat config (required)
```

---

## Features

- **Dashboard** — Stats cards, recent products, category breakdown
- **Products** — Add, Edit, Delete, Filter all products
- **Stock Update** — Add / Remove / Set stock with history log
- **Low Stock Alerts** — Highlights products below threshold
- **Reports** — Full inventory report with CSV export
- **Search** — Filter by keyword, category, price range, status

---

## Technologies Used

| Technology | Purpose |
|---|---|
| JSP (JavaServer Pages) | Website pages (same format as instructor's ecommerce site) |
| Bootstrap 3 | Responsive UI styling |
| Maven | Build tool — packages everything into a WAR file |
| Jenkins | CI/CD — auto-deploys on every git push |
| Apache Tomcat | Web server — hosts the WAR file |
| AWS EC2 | Two cloud servers (Jenkins + Tomcat) |

---

## CI/CD Flow (same as instructor's setup)

```
1. Developer pushes code → GitHub
2. GitHub Webhook → triggers Jenkins
3. Jenkins: Checkout → Maven Build → Test → Package WAR
4. Jenkins: SCP WAR to Tomcat EC2
5. Jenkins: Restart Tomcat
6. App live at: http://<tomcat-ip>:8080/inventory/
```

---

## How to Deploy

### Step 1 — Update Jenkinsfile
Edit `Jenkinsfile` and set your Tomcat EC2 IP:
```
TOMCAT_HOST = '13.XX.XX.XX'   ← your real IP
```

### Step 2 — Push to GitHub
```bash
git add .
git commit -m "Add inventory management system"
git push origin main
```

### Step 3 — Jenkins runs automatically
GitHub webhook triggers Jenkins which builds and deploys the WAR.

### Step 4 — Access the App
```
http://<your-tomcat-ec2-ip>:8080/inventory/
```

---

## Build Manually (without Jenkins)

```bash
mvn clean package
# WAR file created at: target/inventory-1.0.0.war
# Copy to Tomcat: cp target/inventory-1.0.0.war /opt/tomcat/webapps/
```
