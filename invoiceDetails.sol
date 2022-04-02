// SPDX-License-Identifier: GPL-3.0

//Objective:
//Store buyerPan,sellerPan,invoiceAmount,invoiceDate
//Provide list of each invoices with buyerPan

pragma solidity >=0.7.0 <0.9.0;

contract invoice{
    address private seller;
    string sellerPan;
     
constructor(){
    seller=msg.sender;
}

    struct invoiceDetails{
     string buyerPan;
     uint invoiceAmount;
     uint invoiceDate;
     uint id;
    }

    struct sellerDetails{
     string _sellerPan ;
     address _sellerAddress ;
    }
    
    //To store seller details
    sellerDetails details;
    
    function setSellerDetails(string memory _sellerPan)public onlyOwner{
          details._sellerAddress=seller;
          //Set sellerpan as state variable and in struct type
          details._sellerPan=sellerPan=_sellerPan;
    }

    //To know invoiceDetails from buyerPan
    mapping(string=>invoiceDetails)buyerDetails;


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

//Get seller details 
function getSellerDetails() public view returns(sellerDetails memory){
    return details;
}

}
