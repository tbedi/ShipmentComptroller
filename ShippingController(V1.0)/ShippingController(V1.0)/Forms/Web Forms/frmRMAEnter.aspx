﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Master Forms/Admin.Master" AutoEventWireup="true" CodeBehind="frmRMAEnter.aspx.cs" Inherits="ShippingController_V1._0_.Forms.Web_Forms.frmRMAEnter" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table style="width:100%">
        <tr>
            <td colspan="5" class="TitleStrip">Return Details Information (RMA) 
               </td>
        </tr>
        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lblRMAnumber" runat="server" Text="RMA Number  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtrmanumber" runat="server" ></asp:TextBox>
            </td>
            <td style="width:10%" class="tdRight">
                <asp:Label ID="lblvendernumber" runat="server" Text="Vender Number  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtvendernumber" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lblstatus" runat="server" Text="Status  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:DropDownList ID="ddlstatus" runat="server" Width="127px" AutoPostBack="True">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Approved</asp:ListItem>
                                    <asp:ListItem Value="2">Pending</asp:ListItem>
                                    <asp:ListItem Value="3">Canceled</asp:ListItem>
                                </asp:DropDownList>
            </td>
            <td style="width:10%" class="tdRight">
                <asp:Label ID="lblvendername" runat="server" Text="Vender Name  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtvendername" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lbldecisision" runat="server" Text="Decision  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:DropDownList ID="ddldecision" runat="server" Width="127px" AutoPostBack="True">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Approved</asp:ListItem>
                                    <asp:ListItem Value="2">Pending</asp:ListItem>
                                    <asp:ListItem Value="3">Canceled</asp:ListItem>
                                </asp:DropDownList>
            </td>
            <td style="width:10%" class="tdRight">
                <asp:Label ID="lblrequestdate" runat="server" Text="Request Date  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtrequestdate" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="5" class="TitleStrip">PO/Order Detail (RMA) 
               </td>
        </tr>

        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lblponumber" runat="server" Text="PO Number  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtponumber" runat="server" ></asp:TextBox>
            </td>
            <td style="width:10%" class="tdRight">
                <asp:Label ID="lblcustomername" runat="server" Text="Customer Name  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtcustomername" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lblcustomeraddress" runat="server" Text="Customer Address  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtcustomeraddress" runat="server" ></asp:TextBox>
            </td>
            <td style="width:10%" class="tdRight">
                <asp:Label ID="lblcity" runat="server" Text="City  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtcity" runat="server" ></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lblstate" runat="server" Text="State/Province  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtstate" runat="server" ></asp:TextBox>
            </td>
            <td style="width:10%" class="tdRight">
                <asp:Label ID="lblzipcode" runat="server" Text="Zip/Postal Code  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtzipcode" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:10%" class="tdRight">
                 <asp:Label ID="lblcountry" runat="server" Text="Country  :" CssClass="lbl" ></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox CssClass="txt" ID="txtcountry" runat="server" ></asp:TextBox>
            </td>
            <td style="width:10%" class="tdRight" colspan="2">
               
            </td>
            
        </tr>
         <tr>
            <td colspan="5" class="TitleStrip">Return Details 
               </td>
        </tr>
        <tr>
            <td colspan="5" align="center" > 
               
                                     
                <asp:GridView ID="gvReturnDetails" Width="100%" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                                                ForeColor="Black" AllowSorting="true" >
                    <Columns>
                         <asp:TemplateField HeaderText="SKU" >
                                 <ItemTemplate >
                                     <asp:TextBox ID="txtSKU" runat="server" Text='<%# Eval("SKU") %>'  AutoPostBack="True" OnTextChanged="txtSKU_TextChanged" >

                                     </asp:TextBox>
                                       <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server"
                                                     ServiceMethod="SearchSKUNumber"
                                                     MinimumPrefixLength="1"
                                                     ServicePath="~/Forms/Web Forms/AutoCompleteService.aspx"
                                                     CompletionInterval="100"
                                                     EnableCaching="true"
                                                     CompletionSetCount="10"
                                                     TargetControlID="txtSKU">
                                                 </asp:AutoCompleteExtender>
                                </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Product Name" >
                                 <ItemTemplate>
                                     <asp:TextBox ID="txtproductname" runat="server" Text='<%# Eval("ProductName") %>'  ></asp:TextBox>
                                </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Quantity" >
                                 <ItemTemplate>
                                    <asp:TextBox ID="txtquantity" runat="server" Text='<%# Eval("Quantity") %>'  ></asp:TextBox>
                                </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:ImageField HeaderText="Images">
                        </asp:ImageField>
                        <asp:BoundField HeaderText="Reasons" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>

         <tr>
            <td colspan="5" class="TitleStrip">Reason(s) for Return 
               </td>
        </tr>
        <tr>
            <td colspan="5">
                <table style="width:90%">
                    <tr>
                        <td style="width:30%">
                            <asp:CheckBox ID="chkitemdamaged" Text="Item Damaged." runat="server"  CssClass="lbl"/>
                        </td >
                        <td style="width:30%" >
                            <asp:CheckBox ID="chkitemordered" Text="Incorrect item ordered." runat="server" CssClass="lbl" />
                        </td>
                        <td style="width:30%">
                            <asp:CheckBox ID="chkwrongitem" Text="Received wrong item." runat="server" CssClass="lbl"/>
                        </td>
                    </tr>

                </table>

            </td>

        </tr>
        <tr>
            <td colspan="5">
                <table style="width:90%">
                    <tr>
                        <td style="width:30%">
                            <asp:CheckBox ID="chkitemdifferent" Text="Item is different from displayed on web." runat="server" CssClass="lbl"/>
                        </td >
                        <td style="width:30%" >
                            <asp:CheckBox ID="chkduplicate" Text="Duplicate Shipment." runat="server" CssClass="lbl"/>
                        </td>
                        <td style="width:30%">
                            <asp:CheckBox ID="chknotsatisfied" Text="Not satisfied with item." runat="server" CssClass="lbl" />
                        </td>
                    </tr>

                </table>

            </td>

        </tr>

        <tr >
            <td class="tdRight">
                 <asp:Label ID="lblotherreasons" runat="server" Text="Enter Other Reasons  :" CssClass="lbl" ></asp:Label>
            </td>
            <td>
                 <asp:TextBox CssClass="txt" ID="txtotherreasons" runat="server" Width="242px" ></asp:TextBox>

            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlotherreasons" runat="server" style="width:50%" AutoPostBack="True" OnSelectedIndexChanged="ddlotherreasons_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td colspan="5">
                <table style="width:100%">
                    <tr>
                        <td style="width:25%">

                        </td>
                        <td style="width:25%" align="center">
                            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn" OnClick="btnsave_Click"  />
                        </td>
                        <td style="width:25%" align="center">
                            <asp:Button ID="btncancle" runat="server" Text="Cancel" CssClass="btn"  />
                        </td>
                        <td style="width:25%">

                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
        </div>

</asp:Content>
