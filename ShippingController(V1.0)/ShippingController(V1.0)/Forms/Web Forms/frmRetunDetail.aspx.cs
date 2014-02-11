﻿using PackingClassLibrary.CustomEntity.SMEntitys.RGA;
using ShippingController_V1._0_.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PackingClassLibrary;
using System.IO;
using System.Data;
using System.Threading;


namespace ShippingController_V1._0_.Forms.Web_Forms
{
    public partial class frmRetunDetail : System.Web.UI.Page
    {
        string ImagesName;
        modelReturn _mReturn = new modelReturn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillReturnMasterGv(Obj.Rcall.ReturnAll());

                ImagesHide();
            }
        }

        #region Functions

        public void SetScrooToTop()
        {
            //Run the Javascript from code;
            Page.ClientScript.RegisterStartupScript(GetType(), "MyScript", "javascript:ResetScrollToTop();", true);
         
        }


        public void FillReturnMasterGv(List<Return> lsReturn)
        {

            Obj._lsreturn = lsReturn;

            gvReturnInfo.DataSource = lsReturn;
            gvReturnInfo.DataBind();
            
            foreach (GridViewRow row in gvReturnInfo.Rows)
            {
                int Value = Convert.ToInt32(row.Cells[2].Text);
                row.Cells[2].Text = _mReturn.ConvertToDecision(Value);
                if (Value == 0) row.Cells[2].ForeColor = System.Drawing.Color.DarkGreen;
                
                else if (Value == 3) row.Cells[2].ForeColor = System.Drawing.Color.DarkRed;
                int Value1 = Convert.ToInt32(row.Cells[3].Text);
                if (Value1 == 0) row.Cells[3].ForeColor = System.Drawing.Color.Green;
              
                else if (Value1 == 3) row.Cells[3].ForeColor = System.Drawing.Color.DarkRed;
                row.Cells[3].Text = _mReturn.ConvertToDecision(Value1);
            }

            if (IsPostBack)
            {
                FillReturnDetails(_mReturn.ReturnAllRowsfromReturnTbl(lsReturn));
            }
        }


        public void FillReturnDetails(List<ReturnDetail> lsReturnDetails)
        {
            try
            {
                Obj._lsReturnDetails = lsReturnDetails;
                var ReaturnDetails = from Rs in lsReturnDetails
                         select new
                         {
                            Rs.RGADROWID,
                            Rs.SKUNumber,
                            Rs.ProductName,
                            Rs.DeliveredQty,
                            Rs.ReturnQty,
                            ReturnReasons = Obj.Rcall.ReasonsListByReturnDetails(Rs.ReturnDetailID)
                         };

                gvReturnDetails.DataSource = ReaturnDetails.ToList();
                gvReturnDetails.DataBind();

                gvReturnDetails_SelectedIndexChanged(null,EventArgs.Empty);
            }
            catch (Exception)
            {}
        }

       

        public void ResetAll()
        {
            txtCustomerName.Text = "";
            txtOrderNumber.Text = "";
            txtPoNum.Text = "";
            txtRMANumber.Text = "";
            txtShipmentID.Text = "";
            txtVendorName.Text = "";
            txtVendorNumber.Text = "";
            FillReturnMasterGv(Obj.Rcall.ReturnAll());
            dtpFromDate.Text = "";
            dtpToDate.Text = "";
            ImagesHide();

        }

        public void ImagesHide()
        {
            lblImagesFor.Text = "";
            Img0.Visible = false;
            Img2.Visible = false;
            Img3.Visible = false;
            Img4.Visible = false;
            Img1.Visible = false;
            Img5.Visible = false;
            Img6.Visible = false;
            Img7.Visible = false;
            Img8.Visible = false;
            Img9.Visible = false;
            Img10.Visible = false;
        }
        #endregion

        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                modelExportTo.RGAExcel(Obj._lsreturn);
            }
            catch (Exception)
            { }
        }

        protected void txtRMANumber_TextChanged(object sender, EventArgs e)
        {
            if (txtRMANumber.Text.Trim()!="")
            {
                var RMA = from returnALL in Obj._lsreturn
                          where returnALL.RMANumber == txtRMANumber.Text
                          select returnALL;

                FillReturnMasterGv(RMA.ToList());
                SetScrooToTop();
            }
        }

        protected void txtShipmentID_TextChanged(object sender, EventArgs e)
        {
            if (txtShipmentID.Text.Trim() != "")
            {
                var ShipID = from returnAll in Obj._lsreturn
                             where returnAll.ShipmentNumber == txtShipmentID.Text
                             select returnAll;

                FillReturnMasterGv(ShipID.ToList());
                SetScrooToTop();
            }
        }

        protected void txtOrderNumber_TextChanged(object sender, EventArgs e)
        {
            if (txtOrderNumber.Text.Trim() != "")
            {
                var OrderNum = from all in Obj._lsreturn
                               where all.OrderNumber == txtOrderNumber.Text
                               select all;

                FillReturnMasterGv(OrderNum.ToList());
                SetScrooToTop();
            }
        }

        protected void txtPoNum_TextChanged(object sender, EventArgs e)
        {
            if (txtPoNum.Text.Trim()!="")
            {
                var PONum = from all in Obj._lsreturn
                            where all.PONumber == txtPoNum.Text
                            select all;

                FillReturnMasterGv(PONum.ToList());
                SetScrooToTop();
            } 
        }
        
        protected void gvReturnInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                FillReturnDetails(Obj.Rcall.ReturnDetailByRGAROWID(_mReturn.linkButtonText("lbtnRGANumberID", gvReturnInfo)));
            }
            catch (Exception)
            { }
        }

        protected void gvReturnDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
               ImagesHide();
               string ReturnROWID = _mReturn.linkButtonText("lbtnRmaDetailNumberID", gvReturnDetails);
                lblImagesFor.Text = "Sorry! Images for GRA Detail Number : " + ReturnROWID + " not found!";
                List<string> lsImages2 = Obj.Rcall.ReturnImagesByReturnDetailsID(Obj.Rcall.ReturnDetailByRGADROWID(ReturnROWID)[0].ReturnDetailID);
                List<String> lsImages = new List<string>();
                String ImgServerString = System.Configuration.ConfigurationManager.AppSettings["ImageServerPath"].ToString();
               
                foreach (var Imaitem in lsImages2)
                {
                    //lsImages.Add("~/images/"+Imaitem.Split(new char[] { '\\' }).Last().ToString());
                    lsImages.Add(ImgServerString.Replace("#{ImageName}#", Imaitem.Split(new char[] { '\\' }).Last().ToString()));
                }
                if (lsImages.Count>0)
                {
                    lblImagesFor.Text = "Images for GRA Detail Number : " + ReturnROWID;
                    for (int j = 0; j < lsImages.Count(); j++)
                    {
                        if (j == 0)
                        { 
                            Img0.Visible = true;
                            Img0.Src =  lsImages[j];
                            ImagesName = lsImages[j];
                        }
                        if (j == 1)
                        {
                            Img1.Visible = true;
                            Img1.Src =  lsImages[j];
                        }
                        if (j == 2)
                        {
                            Img2.Visible = true;
                            Img2.Src =  lsImages[j];
                        }
                        if (j == 3)
                        {
                            Img3.Visible = true;
                            Img3.Src =  lsImages[j];
                        }
                        if (j == 4)
                        {
                            Img4.Visible = true;
                            Img4.Src =  lsImages[j];
                        }
                        if (j == 5)
                        {
                            Img5.Visible = true;
                            Img5.Src =  lsImages[j];
                        }
                        if (j == 6)
                        {
                            Img6.Visible = true;
                            Img6.Src =  lsImages[j];
                        }
                        if (j == 7)
                        {
                            Img7.Visible = true;
                            Img7.Src =  lsImages[j];
                        }
                        if (j == 8)
                        {
                            Img8.Visible = true;
                            Img8.Src =  lsImages[j];
                        }
                        if (j == 9)
                        {
                            Img9.Visible = true;
                            Img9.Src =  lsImages[j];
                        }
                        if (j == 10)
                        {
                            Img10.Visible = true;
                            Img10.Src =  lsImages[j];
                        }
                    } 
                }


            }
            catch (Exception)
            { }
        }

        protected void btnRefresh2_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        protected void txtCustomerName_TextChanged(object sender, EventArgs e)
        {
            if (txtCustomerName.Text.Trim() != "")
            {
                List<Return> LsCustomers = new List<Return>();
                foreach (var item in Obj._lsreturn)
                {
                    if (item.CustomerName1.Contains(txtCustomerName.Text))
                    {
                        LsCustomers.Add(item);
                    }
                }
                FillReturnMasterGv(LsCustomers.ToList());
                SetScrooToTop();
            } 
        }

        protected void txtVendorName_TextChanged(object sender, EventArgs e)
        {
            if (txtVendorName.Text.Trim() != "")
            {
                List<Return> LsVendor = new List<Return>();
                foreach (var item in Obj._lsreturn)
                {
                    if (item.VendoeName.Contains(txtVendorName.Text))
                    {
                        LsVendor.Add(item);
                    }
                }
                FillReturnMasterGv(LsVendor.ToList());
                SetScrooToTop();
            } 
        }

        protected void dtpToDate_TextChanged(object sender, EventArgs e)
        {
            if (dtpToDate.Text.Trim() != "" && dtpFromDate.Text.Trim() != "")
            {
                DateTime Fdate;
                DateTime TDate;
                DateTime.TryParse(dtpFromDate.Text, out Fdate);
                DateTime.TryParse(dtpToDate.Text, out TDate);

                var fromTo = from ls in Obj._lsreturn
                             where ls.ReturnDate.Date >= Fdate.Date && ls.ReturnDate <= TDate.Date
                             select ls;
                FillReturnMasterGv(fromTo.ToList());
                SetScrooToTop();
            }
        }

        protected void txtVendorNumber_TextChanged(object sender, EventArgs e)
        {
            if (txtVendorNumber.Text.Trim() != "")
            {
                List<Return> LsVendorNUm = new List<Return>();
                foreach (var item in Obj._lsreturn)
                {
                    if (item.VendorNumber.Contains(txtVendorNumber.Text))
                    {
                        LsVendorNUm.Add(item);
                    }
                }
                FillReturnMasterGv(LsVendorNUm.ToList());
                SetScrooToTop();
            } 

        }

        protected void gvReturnInfo_Sorting(object sender, GridViewSortEventArgs e)
        {
            FillReturnMasterGv( _mReturn.SortedListOFReturn( e.SortExpression.ToString()));
        }

        protected void gvReturnDetails_Sorting(object sender, GridViewSortEventArgs e)
        {
            ImagesHide();
            FillReturnDetails(_mReturn.SortedListOfReturnDetails(e.SortExpression.ToString()));
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            String RowId = (((GridViewRow)((LinkButton)sender).Parent.Parent).Cells[0].FindControl("lbtnRGANumberID") as LinkButton).Text;
            Response.Redirect("~/Forms/Web Forms/frmReturnEdit.aspx?RGAROWID=" + RowId);
        }
    }
}