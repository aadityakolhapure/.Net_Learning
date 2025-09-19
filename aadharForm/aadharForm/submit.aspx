<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submit.aspx.cs" Inherits="aadharForm.submit" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aadhaar Application Submit</title>
</head>
<body>
<%
    try
    {
        string preEnroll = Request.Params["PreEnrollmentID"];
        string aadhaar = Request.Params["aadhaarNo"];
        string updateType = Request.Params["UpdateType"];
        string fullName = Request.Params["FullName"];
        string gender = Request.Params["Gender"];
        string birthDate = Request.Params["BirthDate"];
        string birthVerification = Request.Params["dobVerification"];

        string careOf = Request.Params["CareOf"];
        string houseNo = Request.Params["HouseNo"];
        string street = Request.Params["Street"];
        string landmark = Request.Params["Landmark"];
        string area = Request.Params["Area"];
        string village = Request.Params["Village"];
        string postOffice = Request.Params["PostOffice"];
        string district = Request.Params["District"];
        string subDistrict = Request.Params["SubDistrict"];
        string state = Request.Params["State"];
        string mobile = Request.Params["MobileNo"];
        string pin = Request.Params["PinCode"];

        string guardianType = Request.Params["GuardianType"];
        string guardianName = Request.Params["GuardianName"];
        string guardianAadhar = Request.Params["guardianAadhaar"];

        string verificationType = Request.Params["VerificationType"];
        string poi = Request.Params["poiDoc"];
        string poa = Request.Params["poaDoc"];
        string dobDoc = Request.Params["dobDoc"];
        string por = Request.Params["porDoc"];

        string introducerName = Request.Params["IntroducerName"];
        string introducerSignature = Request.Params["IntroducerSignature"];

        string declarationText = Request.Params["DeclarationText"];

        string path = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=AadharDB;Integrated Security=True";
        SqlConnection con = new SqlConnection(path);
        con.Open();

        string query = @"INSERT INTO AadharApplications
        (PreEnrollmentID, AadharNumber, UpdateType, FullName, Gender, BirthDate, BirthVerification,
         CareOf, HouseNo, Street, Landmark, Area, Village, PostOffice, District, SubDistrict, State, MobileNo, PinCode,
         GuardianType, GuardianName, GuardianAadhar, VerificationType, POI, POA, DOBDoc, POR,
         IntroducerName, IntroducerSignature, DeclarationText)
        VALUES
        ('" + preEnroll + "','" + aadhaar + "','" + updateType + "','" + fullName + "','" + gender + "','" + birthDate + "','" + birthVerification + "'," +
        "'" + careOf + "','" + houseNo + "','" + street + "','" + landmark + "','" + area + "','" + village + "','" + postOffice + "','" + district + "','" + subDistrict + "','" + state + "','" + mobile + "','" + pin + "'," +
        "'" + guardianType + "','" + guardianName + "','" + guardianAadhar + "','" + verificationType + "','" + poi + "','" + poa + "','" + dobDoc + "','" + por + "'," +
        "'" + introducerName + "','" + introducerSignature + "','" + declarationText + "')";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();

        con.Close();

        Response.Redirect("index.aspx?msg=success");
    }
    catch (Exception ex)
    {
        Response.Write("Error: " + ex.Message);
    }
%>
</body>
</html>
