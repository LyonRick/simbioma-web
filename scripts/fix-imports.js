const fs = require('fs');
const path = require('path');

const dir = path.join(__dirname, '../components');

function processDirectory(directory) {
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

        // Replace utility import
        newData = newData.replace(/from "\.\/utils"/g, 'from "@/lib/utils"');
        newData = newData.replace(/from "\.\.\/ui\/utils"/g, 'from "@/lib/utils"');
        newData = newData.replace(/from "\.\.\/utils"/g, 'from "@/lib/utils"');
        newData = newData.replace(/from "\.\.\/\.\.\/ui\/utils"/g, 'from "@/lib/utils"');

        // Remove version suffixes from imports (e.g. @1.2.3)
        newData = newData.replace(/@\d+\.\d+\.\d+/g, '');

        if (newData !== data) {
            fs.writeFile(filePath, newData, 'utf8', (err) => {
                if (err) {
                    console.error(`Error writing file ${filePath}:`, err);
                } else {
                    console.log(`Fixed imports in ${filePath}`);
                }
            });
        }
    });
}

processDirectory(dir);
