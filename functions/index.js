const functions = require("firebase-functions");
const stripe = require("stripe")("sk_test_51KmdOnEkIt0KjvdDc7RNFZCY0dYLfDwpS7wcl1bLeskfpz3TpAYFHwLomyz25wqqTgkbxF6i6pA7xLaSJzfFD01z00onZSkvqc");

exports.stripePaymentIntentRequest = functions.https.onRequest(async (req, res) => {
    try{
        let customerId;

        //Gets the customer who's email id matcheds the one sent by the client
        const customerList = await stripe.customers.list({
            email: req.body.email,
            limit: 1
        });

        //Checks if the customer exists, if not creates a new customer
        if( customerList.data.length !== 0){
            customerId = customerList.data[0].id;
        }
        else{
            const customer = await stripe.customers.create({
                email: req.body.email
            });
            customerId = customer.data.id;
        }

        //Creates a temporary secret key linked with the customer
        const ephameralKay = await stripe.ephameralKay.create(
            { customer: customerId },
            { apiVersion: '2020-08-27'}
        );

        //Creates a new payment intent with amount passed in from the client
        const paymentIntent = await stripe.paymentIntents.create({
            amount: parseInt(req.body.amount),
            currency: 'usd',
            customer: customerId,
        })

        res.status(200).send({
            paymentIntent: paymentIntent.client_secret,
            ephameralKay: ephameralKay.secret,
            customer: customerId,
            success: true,
        })
    } catch(error){
        res.status(404).send({ success: false, error: error.message})
    }
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
