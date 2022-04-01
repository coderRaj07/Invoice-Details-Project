// SPDX-License-Identifier: GPL-3.0

//Objective:
//Store buyerPan,sellerPan,invoiceAmount,invoiceDate
//Provide list of each invoices with buyerPan

pragma solidity >=0.7.0 <0.9.0;

contract invoice{
    address private seller;
    string sellerPan;
     
    struct invoiceDetails{
     string buyerPan;
     uint invoiceAmount;
     uint invoiceDate;
     uint id;
    }
    
    //To know invoiceDetails from buyerPan
    mapping(string=>invoiceDetails)buyerDetails;

constructor(){
    seller=msg.sender;
}

modifier onlyOwner(){
    require(msg.sender==seller,"Accessible only to seller");
    _;
}

//Invoice details must be set by Owner
function setInvoiceDetails(string memory _buyerPan,uint _invoiceAmount,uint _invoiceDate) public onlyOwner{
     buyerDetails[_buyerPan].buyerPan=_buyerPan;
     buyerDetails[_buyerPan].invoiceAmount=_invoiceAmount;
     buyerDetails[_buyerPan].invoiceDate=_invoiceDate;
}

//Get invoice details from buyerPan
function getInvoiceDetails(string memory _buyerPan) public view returns(invoiceDetails memory){
    return buyerDetails[_buyerPan];
}

}
