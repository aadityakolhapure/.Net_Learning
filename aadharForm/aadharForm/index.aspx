<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="aadharForm.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aadhaar Enrollment / Update Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
    <div class="max-w-4xl mx-auto bg-white shadow-md rounded-lg p-8">

        <div>
            <center>
                <image src="images.png" height="30px" width="80px" class="m-6"></image>
            </center>

        </div>
        <h1 class="text-xl font-bold text-center mb-3 border-b pb-2 bg-red-500 text-white">Aadhaar Enrollment / Update Form
        </h1>

        <p class="text-sm text-justify font-bold text-gray-800">
            Aadhaar Enrolment and Mandatory Biometric Update is free. No charges are applicable for Form. 
            In case of Correction/ Update, provide your Aadhaar Number (UID). Full Name and only that field 
            which needs Correction/ Update.
        </p>

        <div class="flex items-center space-x-6 mt-3 justify-between">
            <div class="flex flex-row">
                <label class="flex items-center mr-2">
                    <input type="radio" name="residentType" value="resident" required class="mr-2">
                    Resident
                </label>
                <label class="flex items-center">
                    <input type="radio" name="residentType" value="nonresident" class="mr-2">
                    Non-Resident
                </label>
            </div>
            <span class="text-red-500 text-end ml-24 font-bold">*Please follow the instruction while fill the form.</span>
        </div>

        <form id="form1" runat="server">
            <div>
                <% 
                    string msg = Request.QueryString["msg"];
                    if (!string.IsNullOrEmpty(msg) && msg == "success")
                    {
                %>
                <div style="color: green; font-weight: bold; margin: 10px 0;">
                    ✅ Form Submitted Successfullly!
                </div>
                <% 
                    }
                %>
            </div>
        </form>

        <form action="submit.aspx" method="post">
            <div>

                <div class="grid grid-cols-[1fr_3fr_1fr_3fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">1</div>
                    <div class="border-r border-black p-2">
                        Pre EnrollmentId (if applicable) :-
                        <input type="text" name="preEnrollmentId" pattern="\d{14}" maxlength="14" title="Enter 14-digit Enrollment ID" class="border-b-2 border-gray-300" />
                    </div>
                    <div class="border-r border-black p-2 font-bold text-center">2</div>
                    <div class="p-2">
                        Aadhaar number (UID) :-
                        <input type="text" name="aadhaarNo" pattern="\d{12}" maxlength="12" title="Enter valid 12-digit Aadhaar Number" required class="border-b-2 border-gray-300" />
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_7fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">2.1</div>
                    <div class="border-r border-black p-2">
                        <div class="flex flex-row">
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="biometric" required class="mr-2">
                                Bio-metric update
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="mobile" class="mr-2">
                                Mobile
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="dob" class="mr-2">
                                Date of Birth
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="address" class="mr-2">
                                Address
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="name" class="mr-2">
                                Name
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="gender" class="mr-2">
                                Gender
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="updateType" value="email" class="mr-2">
                                Email
                            </label>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_7fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">3</div>
                    <div class="border-r border-black p-2">
                        Full Name :-
                        <input type="text" name="fullName" pattern="[A-Za-z\s]+" title="Only alphabets allowed" required class="border-b-2 border-gray-300 w-[75%]" />
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_3fr_1fr_3fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">4</div>
                    <div class="border-r border-black p-2">
                        Gender :-
                        <div class="flex flex-row">
                            <label class="flex items-center mr-2">
                                <input type="radio" name="gender" value="male" required class="mr-2">
                                Male
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="gender" value="female" class="mr-2">
                                Female
                            </label>
                            <label class="flex items-center">
                                <input type="radio" name="gender" value="other" class="mr-2">
                                Others
                            </label>
                        </div>
                    </div>
                    <div class="border-r border-black p-2 font-bold text-center">5</div>
                    <div class="p-2">
                        Date of birth :-
                        <input type="date" name="dob" max="2025-12-31" required class="border-b-2 border-gray-300" />
                        <br />
                        <div class="flex flex-row">
                            <label class="flex items-center mr-2">
                                <input type="radio" name="dobVerification" value="declared" required class="mr-2">
                                Declared
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="dobVerification" value="verified" class="mr-2">
                                Verified
                            </label>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_7fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">6</div>
                    <div class="border-r border-black p-2">
                        Address C/O :-
                        <input type="text" name="careOf" required class="border-b-2 border-gray-300" placeholder="Name" />
                    </div>

                    <div class="border-r border-black p-2 font-bold text-center"></div>
                    <div class="grid grid-cols-[4fr_4fr] border border-black w-full">
                        <div class="border-r border-black p-2">
                            House /Apartment Number :-
                            <input type="text" name="houseNo" required class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            Street :-
                            <input type="text" name="street" required class="border-b-2 border-gray-300" />
                        </div>
                    </div>

                    <div class="border-r border-black p-2 font-bold text-center"></div>
                    <div class="grid grid-cols-[4fr_4fr] border border-black w-full">
                        <div class="border-r border-black p-2">
                            Landmark :-
                            <input type="text" name="landmark" class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            Area/Sector :-
                            <input type="text" name="area" required class="border-b-2 border-gray-300" />
                        </div>
                    </div>

                    <div class="border-r border-black p-2 font-bold text-center"></div>
                    <div class="grid grid-cols-[4fr_4fr] border border-black w-full">
                        <div class="border-r border-black p-2">
                            Village :-
                            <input type="text" name="village" required class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            Post Office :-
                            <input type="text" name="postOffice" required class="border-b-2 border-gray-300" />
                        </div>
                    </div>

                    <div class="border-r border-black p-2 font-bold text-center"></div>
                    <div class="grid grid-cols-[3fr_3fr_3fr] border border-black w-full">
                        <div class="border-r border-black p-2">
                            District :-
                            <input type="text" name="district" required class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            Sub District :-
                            <input type="text" name="subDistrict" required class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            State :-
                            <input type="text" name="state" required class="border-b-2 border-gray-300" />
                        </div>
                    </div>

                    <div class="border-r border-black p-2 font-bold text-center"></div>
                    <div class="grid grid-cols-[4fr_4fr] border border-black w-full">
                        <div class="border-r border-black p-2">
                            Mobile Number :-
                            <input type="tel" name="mobileNo" pattern="[6-9]\d{9}" maxlength="10" title="Enter valid 10-digit Indian mobile number" required class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            Pincode :-
                            <input type="text" name="pincode" pattern="\d{6}" maxlength="6" title="Enter valid 6-digit Pincode" required class="border-b-2 border-gray-300" />
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_7fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">7</div>
                    <div class="border-r border-black p-2">
                        <div class="flex flex-row">
                            Details of :- 
                            <label class="flex items-center mr-2 ml-2">
                                <input type="radio" name="guardianType" value="father" required class="mr-2">
                                Father
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="guardianType" value="mother" class="mr-2">
                                Mother
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="guardianType" value="husband" class="mr-2">
                                Husband
                            </label>
                            <label class="flex items-center mr-2">
                                <input type="radio" name="guardianType" value="wife" class="mr-2">
                                Wife
                            </label>
                        </div>
                        <span class="font-italic text-[14px] font-bold">*Children below 5 years must fill this detail mandatorily.</span>
                    </div>

                    <div class="border-r border-black p-2 font-bold text-center"></div>
                    <div class="grid grid-cols-[4fr_4fr] border border-black w-full">
                        <div class="border-r border-black p-2">
                            Name :-
                            <input type="text" name="guardianName" required class="border-b-2 border-gray-300" />
                        </div>
                        <div class="border-r border-black p-2">
                            Aadhaar Number (UID) :-
                            <input type="text" name="guardianAadhaar" pattern="\d{12}" maxlength="12" title="Enter valid 12-digit Aadhaar Number" required class="border-b-2 border-gray-300" />
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[7fr] border border-black w-full">
                    <div class="border-r border-black p-2">
                        <div class="flex flex-row">
                            Verification Type :- 
                            <label class="flex items-center mr-2 ml-14">
                                <input type="radio" name="verificationType" value="document" required class="mr-2">
                                Document Based
                            </label>
                            <label class="flex items-center">
                                <input type="radio" name="verificationType" value="head" class="mr-2">
                                Head of Family
                            </label>
                        </div>
                        <span class="font-bold font-italic text-[14px]">*Select any one of the fields.</span>
                    </div>
                </div>

                <div class="grid grid-cols-[1fr_7fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center">8</div>
                    <div class="border-r border-black p-2">
                        <div class="flex flex-row">
                            For Document Based :<br />
                            <span class="font-bold font-italic text-[14px]">(Write the name of document in the below fields)</span>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[8fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center grid grid-cols-[4fr_4fr]">
                        <div class="border-r border-black p-2">
                            a. POI<br />
                            <input type="text" name="poiDoc" class="border-b-2 border-gray-300 ml-10" />
                        </div>
                        <div class="border-black p-2">
                            b. POA<br />
                            <input type="text" name="poaDoc" class="border-b-2 border-gray-300 ml-10" />
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[8fr] border border-black w-full">
                    <div class="border-r border-black p-2 font-bold text-center grid grid-cols-[4fr_4fr]">
                        <div class="border-r border-black p-2">
                            c. DOB<br />
                            <input type="text" name="dobDoc" class="border-b-2 border-gray-300 ml-10" />
                        </div>
                        <div class="border-black p-2">
                            d. POR<br />
                            <input type="text" name="porDoc" class="border-b-2 border-gray-300 ml-10" />
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-[8fr] border border-black w-full">
                    <div class="border-r border-black p-2 text-[15px]">
                        I here confirm the identity and address of ________________________ as true, accurate and correct.
                        <br />
                        <br />
                        Introducer Name: ________________________  
                        <span class="ml-28 font-bold">Signature of the Introducer.</span>
                    </div>
                </div>
            </div>

            <span class="text-sm text-justify font-bold text-gray-800 mt-8">I hereby declare that the information provided by me in the Aadhaar Update/Correction form is true, correct and accurate 
                to the best of my knowledge and belief. I understand that if the information provided is found to be false or incorrect, 
                it shall be liable for rejection and necessary action may be taken against me as per the provisions of the law.
            </span>

            <div class="flex flex-row justify-between mt-12 font-bold border-b border-dotted pb-6">
                <div class="w-1/2 pr-4">
                    <p class="mb-6">Verification & Stamp</p>
                    <div class="h-24 border border-gray-400 rounded-md"></div>
                </div>
                <div class="w-1/2 pl-4 text-right">
                    <p class="mb-6">Applicant Signature</p>
                    <div class="h-24 border border-gray-400 rounded-md"></div>
                </div>
            </div>

            <div class="border-b-2 border-gray-200"></div>
            <center>
                <button type="submit" class="p-2 bg-blue-900 text-white rounded-lg mt-2">Submit</button>
            </center>
        </form>
    </div>
</body>
</html>
