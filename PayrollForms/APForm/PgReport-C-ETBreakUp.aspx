<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgReport-C-ETBreakUp.aspx.cs" Inherits="PayrollForms_PgReport_C_ETBreakUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <br />
            <div >
            <h5 class="card-title">ET Breakup</h5>
            </div>
            <br />
            <div class="row">

                <div id="ET-Breakup-View" class=" col-lg-2 col-xl-2">

                     <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol col-sm-12" Text="From Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                           <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control form-control-sm text-uppercase" autocomplete="off" ></asp:TextBox>                                                                        
                        </div>
                    </div>

                     <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol col-sm-12" Text="To Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                           <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm text-uppercase" autocomplete="off"></asp:TextBox>                                                                        
                        </div>
                    </div>

                    <%-- <asp:Label ID="lblnoofdays" runat="server" CssClass="label-conrol" Text="No.of Days"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                           <asp:TextBox ID="txtnoofdays" runat="server" CssClass="form-control form-control-sm text-uppercase" autocomplete="off" placeholder="No.of Days"  ReadOnly="True"></asp:TextBox>                                                                     
                        </div>
                      </div>--%>

                  </div>

                <div class=" col-lg-4 col-xl-4">
   
                    <asp:Label ID="lblCompanyname" runat="server" CssClass="label-conrol col-sm-12" Text="Company Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddlcompanyname" CssClass="form-control form-control-sm text-uppercase" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem>----Select Company Name----</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            </div>
                        </div>
                        
                    <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12" Text="Division Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                         <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm text-uppercase" autocomplete="off" runat="server" placeholder="Division Name"></asp:TextBox>
                            </div>
                        </div>                
                                                           
                  </div>

                 <div class=" col-lg-2 col-xl-2"> 
                    <br/> 
                    <br/>   
                    <br/>
                    <br/>                  
                        <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" />
                    <br />           
                        <asp:Label ID="lblMessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>
                   </div>

                 <div class=" col-lg-2 col-xl-2"> 
                    <br />
                    <br /> 
                    <br />
                    <br />
                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Conform" Width="120"/>
                     <br/>
                         <asp:Label ID="lblMessageBox2" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>   
                   </div>
      
                 <div class=" col-lg-2 col-xl-2"> 
                    <br />
                        <asp:Button ID="btnnewclear" runat="server" CssClass="btn btn-primary " Text="New" Width="120" />
                    <br />
                    <br />
                       <asp:Button ID="btnclose" runat="server" ValidationGroup="txtnoofdays" CssClass="btn btn-primary"  Text="Close" PostBackUrl="~/PayrollForms/SubmenuReports-C.aspx" Width="120"  />  
                   </div>

               </div> 
                 <br/>
        

   <div class="row">

     <div id="tableview-frontview" class="col-lg-12 col-xl-12">  
    
         <asp:GridView ID="DgETBreakup" runat="server"  CssClass="table table-hover table-secondary" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px">

             <FooterStyle HorizontalAlign="Center" />
             <HeaderStyle HorizontalAlign="Center" />
             <RowStyle BackColor="#f5f5ef" />
         </asp:GridView>
     </div>     
  </div>
    
        </ContentTemplate>
    </asp:UpdatePanel>
   

    <%-------------------------%>


    <%--/*---Date Picker----*/--%>

    <script>

        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });          
        }
    </script>

<%--/*-----------------------*/--%>                      


</asp:Content>

