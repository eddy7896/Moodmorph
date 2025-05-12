# MoodMorph

MoodMorph is a modern web application for analyzing the color palette and fonts of any website. Enter a website URL, and MoodMorph will extract and visualize the dominant colors and font families used, presenting them in an interactive, visually appealing way. The tool is designed for designers, developers, and anyone interested in understanding the visual identity of a website.

---

## Features
- Modern glassmorphism UI for address bar and controls
- Extracts and displays the main color palette from any website or uploaded image
- Shows harmonious color relationships and lets you download SVG color cards
- Detects and previews the main fonts used on the site
- Image upload with filename display and clear (X) button
- Address bar doubles as a progress bar with animated fill and live subtext prompts
- Analysis icon (magnifying glass) acts as the analyze button and becomes a clear (X) button when done
- Automatic analysis starts as soon as an image is uploaded (file input or drag-and-drop)
- Responsive design for desktop and mobile
- Animated, colorful background for a delightful user experience


## Setup & Run

### Prerequisites
- Node.js (v16+ recommended)
- npm

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/eddy7896/web-analyser.git
   cd web-analyser/frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the backend API (ensure it runs on `http://localhost:5000`).
4. Start the frontend:
   ```bash
   npm start
   ```
5. Open [http://localhost:3000](http://localhost:3000) in your browser.

### Running Both Frontend and Backend

You can run both the frontend and backend by using the `start-all.bat` script:
```bash
start-all.bat
```
it will install the dependencies and start both the frontend and backend in separate terminal windows.



