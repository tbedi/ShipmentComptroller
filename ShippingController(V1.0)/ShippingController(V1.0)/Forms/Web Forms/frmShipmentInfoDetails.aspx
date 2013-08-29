﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Master Forms/Admin.Master" AutoEventWireup="true" CodeBehind="frmShipmentInfoDetails.aspx.cs" Inherits="ShippingController_V1._0_.Forms.Web_Forms.frmShipmentInfoDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script src="../../Themes/js/jquery-1.5.1.min.js"></script>
    <script src="../../Themes/js/highcharts.js"></script>
    <style type="text/css">
        .accordionHeader {
            border: 1px solid #2F4F4F;
            color: #cfa917;
            background: rgba(0,0,0,0.80);
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top: 5px;
            cursor: pointer;
        }

        .accordionHeaderSelected {
            border: 1px solid #2F4F4F;
            color: white;
            background-color: rgba(0, 0, 0, 0.89);
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top: 5px;
            cursor: pointer;
        }

        .accordionContent {
            background-color: rgba(44, 123, 199, 0.84);
            border: 1px dashed #2F4F4F;
            border-top: none;
            padding: 5px;
            padding-top: 10px;
        }
    </style>
    <table id="tblMain" style="width: 98%">
        <tr>
            <td class="TitleStrip">Shipment Detail Information
            </td>
        </tr>
        <tr>
            <td>
                <div id="dvIDonly" runat="server">
                    <table style="width: 100%; border-bottom-color: #0094ff; border-bottom-width: medium; border-bottom-style: groove;">
                        <tr>
                            <td class="tdRight">
                                <asp:Label ID="Label2" runat="server" Text="ShipmentID :" CssClass="lbl"></asp:Label>
                            </td>
                            <td class="tdLeft">
                                <asp:TextBox CssClass="txt" ID="txtShipmentID" runat="server" OnTextChanged="txtShipmentID_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="txtShipmentID_AutoCompleteExtender" runat="server"
                                    ServiceMethod="SearchpackingID"
                                    MinimumPrefixLength="1"
                                    ServicePath="~/Forms/Web Forms/AutoCompleteService.aspx"
                                    CompletionInterval="100"
                                    EnableCaching="true"
                                    CompletionSetCount="20"
                                    TargetControlID="txtShipmentID">
                                </asp:AutoCompleteExtender>
                            </td>

                            <td class="tdLeft" style="width: 60%; text-align: right;">
                                <asp:Button ID="btnShowShipmentInfoID" runat="server" Text="Filter" CssClass="btn" />
                            </td>

                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="dvAllinfo" runat="server">
                    <table style="width: 100%; border-bottom-color: #0094ff; border-bottom-width: medium; border-bottom-style: groove;">
                        <tr>
                            <td class="tdRight">
                                <asp:Label ID="lblUserName" runat="server" Text="User Name :" CssClass="lbl"></asp:Label>
                            </td>
                            <td class="tdLeft">
                                <asp:DropDownList ID="ddlUserName" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="tdRight">
                                <asp:Label ID="Label1" runat="server" Text="Packing Status :" CssClass="lbl"></asp:Label>
                            </td>
                            <td class="tdLeft">
                                <asp:DropDownList ID="ddlpackingStatus" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlpackingStatus_SelectedIndexChanged">
                                    <asp:ListItem Value="-1" Text="Select">--Select--</asp:ListItem>
                                    <asp:ListItem Value="0" Text="Packed">Packed</asp:ListItem>
                                    <asp:ListItem Value="1" Text="PackedPatially">Patially Packed</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td class="tdRight">
                                <asp:Label ID="lblFromDate" runat="server" Text="From Date :" CssClass="lbl"></asp:Label>
                            </td>
                            <td class="tdLeft">
                                <asp:TextBox CssClass="txt" ID="dtpFromDate" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="dtpFromDate" runat="server" Format="MMM dd, yyyy"></asp:CalendarExtender>
                            </td>
                            <td class="tdRight">
                                <asp:Label ID="lblTodate" runat="server" Text="To Date :" CssClass="lbl"></asp:Label>
                            </td>
                            <td class="tdLeft">
                                <asp:TextBox CssClass="txt" ID="dtpToDate" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="dtpToDate" runat="server" Format="MMM dd, yyyy"></asp:CalendarExtender>
                            </td>
                            <td colspan="2" class="tdRight">
                                <asp:Button ID="btnShowReport" runat="server" Text="Filter" CssClass="btn" OnClick="btnShowReport_Click"    />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="dvShipmentAll" runat="server" style="width: 100%">
                    <table id="tblShipmentsAll" runat="server" style="width: 100%; margin: 0px auto;">
                        <tr>
                            <td>
                                <div id="Div1" runat="server">
                                    <asp:Panel ID="panel1" runat="server" Height="300px" ScrollBars="Auto">
                                        <asp:GridView ID="gvShipmentInformation" Width="100%" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>
                                                <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                                                <asp:BoundField HeaderText="ShipmentID" DataField="ShipmentID">
                                                    <ItemStyle Font-Underline="True" ForeColor="#3366CC" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Location" DataField="Location" />
                                                <asp:BoundField HeaderText="Who" DataField="UserName" />
                                                <asp:BoundField HeaderText="Start Time" DataField="StartTime" />
                                                <asp:BoundField HeaderText="Time Spent" DataField="TimeSpent" />
                                                <asp:BoundField HeaderText="Packing Status" DataField="PackingStatus" />
                                                <asp:BoundField HeaderText="Override" DataField="ManagerOVerride" />
                                                <asp:BoundField HeaderText="Shipping Staus" DataField="ShippedStatus" />
                                                <asp:BoundField HeaderText="Tracking Number" DataField="TrackingNumber" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            <RowStyle BackColor="White" />
                                            <SelectedRowStyle BackColor="Brown" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:HiddenField ID="PosY" runat="server" Value="0" />
                                    <asp:HiddenField ID="PosX" runat="server" Value="0" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="width: 100%">
                                    <asp:Accordion
                                        ID="MyAccordion"
                                        runat="Server"
                                        SelectedIndex="-1"
                                        HeaderCssClass="accordionHeader"
                                        HeaderSelectedCssClass="accordionHeaderSelected"
                                        ContentCssClass="accordionContent"
                                        AutoSize="None"
                                        FadeTransitions="true"
                                        TransitionDuration="250"
                                        FramesPerSecond="40"
                                        RequireOpenedPane="false"
                                        SuppressHeaderPostbacks="true" Width="98%">
                                        <Panes>
                                            <asp:AccordionPane runat="server" ID="userpnl"
                                                HeaderCssClass="accordionHeader"
                                                HeaderSelectedCssClass="accordionHeaderSelected"
                                                ContentCssClass="accordionContent">
                                                <Header> Shipment Details</Header>
                                                <Content>
                                                    <div id="dvRight" runat="server" style="float: left; width: 80%">
                                                        <div style="width: 100%">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label4" runat="server" Text="Shipment ID :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label5" runat="server" Text="SH000xx" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label6" runat="server" Text="User Name :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label7" runat="server" Text="Avinash Patil" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label8" runat="server" Text="Shipment Status :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label9" runat="server" Text="Partially Packed" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label10" runat="server" Text="Time Spend :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label11" runat="server" Text="00:00:00" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label12" runat="server" Text="Total Sku Quantity :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label13" runat="server" Text="50" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label14" runat="server" Text="Location :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label15" runat="server" Text="NYWH" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="tdRight">
                                                                        <asp:Label ID="Label16" runat="server" Text="Override Type :" CssClass="lbl"></asp:Label>
                                                                    </td>
                                                                    <td class="tdLeft">
                                                                        <asp:Label ID="Label17" runat="server" Text="No" CssClass="lblVeriables"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight"></td>
                                                                    <td class="tdLeft"></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div style="width: 100%">
                                                            <asp:GridView HorizontalAlign="Center" ID="gvShipmentDetail" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="SKU Name" DataField="SKUNumber" />
                                                                    <asp:BoundField HeaderText="Qty." DataField="SKUQuantity" />
                                                                    <asp:BoundField HeaderText="Start Time" DataField="PackingDetailStartDateTime" DataFormatString="{0:MMM dd, yyyy hh:mm:ss tt}" />
                                                                    <asp:BoundField HeaderText="Box Qty." DataField="BoxQuantity" />
                                                                    <asp:BoundField HeaderText="Location" DataField="ShipmentLocation" />
                                                                </Columns>
                                                                <FooterStyle BackColor="#CCCCCC" />
                                                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                                <RowStyle BackColor="White" />
                                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </Content>
                                            </asp:AccordionPane>
                                        </Panes>
                                        <HeaderTemplate>ASX</HeaderTemplate>
                                        <ContentTemplate>asdfasdfasdf</ContentTemplate>
                                    </asp:Accordion>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="border: groove medium #0094ff; text-align: center" id="dvUserPacking" runat="server">
                                    <asp:Literal ID="ltrChart" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>

    </table>
</asp:Content>
