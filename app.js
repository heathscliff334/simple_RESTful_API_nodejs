const express = require('express');
const bodyParser = require('body-parser');
const conn = require('./config/database');
const { query } = require('./config/database');
// Express is used for routing
const app = express();
const PORT = process.env.PORT || 5000;

// Set up the body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

// Create or add data
app.post('/api/add_interests', (req, res) => {
    console.log('URL /api/add_interests Accessed');
    // console.log(req.body);

    // The variable for the data and query
    const id_temp = uniqid();
    const data = {id_interest: id_temp,...req.body};
    const query = 'INSERT INTO tb_interests SET ?';
    // Run the query
    conn.query(query, data, (err, rows, field) =>{
        // Error handling
        if(err){
            return res.status(500).json({message: 'Failed to insert the data to tb_interests', error: err});
        }
        res.status(200).json({message: 'Succes to insert the data to tb_interests', success: true});
    });
});

// Read the data
app.get('/api/get_interests', (req, res) => {
    console.log('URL /api/get_projects Accessed');
    const data = {...req.body};
    const query = 'SELECT * FROM tb_interests';

    conn.query(query, data, (err, rows, field) => {
        if(err){
            return res.status(500).json({message: 'Failed to get the data', error: err});
        }
        res.status(200).json({message: 'Success to get the data', success: true, data: rows});
    });
});

// Update the data
app.put('/api/update_interest/:id', (req, res) => {
    console.log('URL /api/update_interest Accessed');
    const data = {...req.body};
    const findIdQuery = 'SELECT * FROM tb_interests WHERE id_interest = ?';
    const updateQuery = 'UPDATE tb_interests SET ? WHERE id_interest = ?';

    conn.query(findIdQuery, req.params.id, (err, rows, field) => {
        if(err){
            return res.status(500).json({message: 'Error to find the data ID', error: err});
        } 
        // If the ID is found
        if(rows.length){
            console.log('ID Found!');
            // Run the update query
            conn.query(updateQuery, [data, req.params.id], (err, rows, field) => {
                if (err){
                    return res.status(500).json({message: 'Error to update the data', error: err});
                }
                return res.status(200).json({message: 'Success to update the data', success: true});
            });
        } 
        // If the ID is not found
        else {
            console.log('ID Not Found!');
            return res.status(404).json({message: 'ID is not found', error: err, success: false});
        }
    });
});
app.delete('/api/delete_interest/:id', (req, res) => {
    console.log('URL /api/delete_interest Accessed');
    const findIdQuery = 'SELECT * FROM tb_interests WHERE id_interest = ?';
    const deleteQuery = 'DELETE FROM tb_interests WHERE id_interest = ?';

    conn.query(findIdQuery, req.params.id, (err, rows, field) =>{
        if(err){
            return res.status(500).json({message:'Error to find the data ID', error: err});
        }
        if(rows.length){
            conn.query(deleteQuery, req.params.id, (err, rows, field) => {
                if(err){
                    return res.status(500).json({message: 'Failed to delete the data', error: err});
                }
                return res.status(200).json({message: 'Deleted successfuly', success: true});
            });
        } else {
            return res.status(404).json({message: 'ID is not found', error: err, success: false});
        }
    });
});

function uniqid(prefix = "", random = false) {
    const sec = Date.now() * 1000 + Math.random() * 1000;
    const id = sec.toString(16).replace(/\./g, "").padEnd(10, "0");
    return `${prefix}${id}${random ? `.${Math.trunc(Math.random() * 100000000)}`:""}`;
};

// For the server
app.listen(PORT, () => console.log('Server running at port : '+PORT));