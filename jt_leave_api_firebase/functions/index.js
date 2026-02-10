

const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
exports.syncEmployees = functions.https.onRequest(async (req, res) => {
  const apiKey = req.headers["x-api-key"];
  if (apiKey !== process.env.AGENT_KEY) {
    return res.status(401).send("Unauthorized");
  }
  const employees = req.body;
  const batch = admin.firestore().batch();
  employees.foreach((emp) => {
    const ref = admin.firestore()
        .collection("employees")
        .doc(emp.employeeCode);
    batch.set(ref, emp, {merge: true});
  });
  await batch.commit();
  res.send({success: true});
});
