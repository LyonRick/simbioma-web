const fs = require('fs');
const path = require('path');

const dirs = [
    path.join(__dirname, '../app'),
    path.join(__dirname, '../components')
];

function processDirectory(directory) {
    if (!fs.existsSync(directory)) return;

    fs.readdir(directory, { withFileTypes: true }, (err, entries) => {
        if (err) {
            console.error('Error reading directory:', err);
            return;
        }

        entries.forEach(entry => {
            const fullPath = path.join(directory, entry.name);

            if (entry.isDirectory()) {
                processDirectory(fullPath);
            } else if (entry.isFile() && (entry.name.endsWith('.tsx') || entry.name.endsWith('.ts'))) {
                processFile(fullPath);
            }
        });
    });
}

function processFile(filePath) {
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error(`Error reading file ${filePath}:`, err);
            return;
        }

        let newData = data;

        // Replace Button import with button (lowercase)
        newData = newData.replace(/from "(@\/components\/ui\/|..\/ui\/|\.\/ui\/)Button"/g, 'from "$1button"');
        newData = newData.replace(/from "(@\/components\/ui\/|..\/ui\/|\.\/ui\/)Card"/g, 'from "$1card"');
        newData = newData.replace(/from "(@\/components\/ui\/|..\/ui\/|\.\/ui\/)Input"/g, 'from "$1input"');

        if (newData !== data) {
            fs.writeFile(filePath, newData, 'utf8', (err) => {
                if (err) {
                    console.error(`Error writing file ${filePath}:`, err);
                } else {
                    console.log(`Fixed casing in ${filePath}`);
                }
            });
        }
    });
}

dirs.forEach(dir => processDirectory(dir));
