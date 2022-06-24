const express = require('express');

const router = express.Router()

module.exports = router;

//Post Method
router.post('/register', async (req, res) => {
       
    console.log(JSON.stringify(req.body))

    const data = new Model({
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        username: req.body.username,
        userpassword: req.body.userpassword,
        age: req.body.age
    })

    try{
        const dataToSave = await  data.save();
        res.status(200).json(dataToSave)
    }
    catch(error){
        res.status(400).json({message: error.message})
    }
})

//Get all Method
router.get('/getAll', async (req, res) => {
    try{
        const data = await Model.find();
        res.json(data)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

// Authentication
router.post('/authentication', async (req, res) => {
    try{
        const data = await Model.find();
        var found = "false";
        console.log(JSON.stringify(req.body))
		console.log(req.body)
        for(var i in data)
        {
            console.log(JSON.stringify(i))
            if(data[i].username == req.body.username && data[i].userpassword == req.body.userpassword)
            {
                console.log(i)
                found = "true";
                break
            }
        }

    res.status(200).json({success: found})
     
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Get by ID Method
router.get('/getOne/:id', async (req, res) => {
    try{
        const data = await Model.findById(req.params.id);
        res.json(data)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Update by ID Method
router.patch('/update/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const updatedData = req.body;
        const options = { new: true };

        const result = await Model.findByIdAndUpdate(
            id, updatedData, options
        )

        res.send(result)
    }
    catch (error) {
        res.status(400).json({ message: error.message })
    }
})

//Delete by ID Method
router.delete('/delete/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const data = await Model.findByIdAndDelete(id)
        res.send(`Document with ${data.name} has been deleted..`)
    }
    catch (error) {
        res.status(400).json({ message: error.message })
    }
})


const Model = require('../model/model');
