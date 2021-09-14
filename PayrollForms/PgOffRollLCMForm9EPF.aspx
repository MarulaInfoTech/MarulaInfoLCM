<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgOffRollLCMForm9EPF.aspx.cs" Inherits="PayrollForms_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    <br />
    <div>
        <h6 class="card-title">Form 9 EPF</h6>
    </div>
    <br />

    <div class="row">

        <div id="" class="col-lg-4 col-xl-4">
            <asp:Label ID="lblcompanycode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Code"></asp:Label>
            <div class="form-group">
                <div class="col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                        <asp:ListItem>---- Select Client Name ----</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div id="" class="col-lg-4 col-xl-4">
            <asp:Label ID="lblb" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
            <div class="form-group">
                <div class="col-lg-12 col-xl-12">
                    <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" Style="font-size: smaller" OnClick="btnview_Click" />

                </div>
            </div>
        </div>

    </div>
    <br />

    <div id="tableview-endview" class="row col-lg-12 col-xl-12">

        <asp:GridView ID="Dgclientname" runat="server" CssClass="Grid table table-hover table-secondary"
            HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" AutoGenerateColumns="False">
            <Columns>

                <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblemployeeid" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='0'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UAN NO">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("UANNO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF MemberID No">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PFNO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ESI EmployeeID No ">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("ESINO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Application Name">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("GENDER") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date of Join">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("DATEOFJOIN") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Father Name">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("FATHERNAME") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Husband's Incase of Married Women Name" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='0'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Relationship" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='0'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Martial Status">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("MARTIALSTATUS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Mobile No">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("MOBILENO1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Mobile No 2" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("MOBILENO2") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email ID">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Adhar No">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("ADHARNO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="PAN No">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PANNO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="BANK NAME">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("BANKNAME") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Bank Account NO">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("ACCOUNTNO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="250px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="IFSC CODE">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("IFSCCODE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nominee Name">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PFNOMINEENAME") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nominee Relationship">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PFNOMINEERELATIONSHIP") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nominee DOB">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PFNOMINEEDOB") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nominee Mobile No">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PFNOMINEEMOBILENUMBER") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nominee Home No" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("PFNOMINEEHOMENUMBER") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Unit Of Establishment">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date Of Left">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("RELEAVINGDATE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Reason Of Left">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("REASON") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="400px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Employee Status">
                    <ItemTemplate>
                        <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("EMPLOYEESTATUS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Part Amount(Form 31)Claim Date">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFPartDate" runat="server" DataFormatString="{dd/MM/yyyy}" TextMode="DateTime" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                  
                    <ControlStyle Width="270px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Part Amount(Form 31)Claim Status">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFPartStatus" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                    
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Part Amount(Form 31)Claim Amount">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFPartAmt" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                    
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Settlement(Form 19)Claim Date">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFSetDate" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                   
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Settlement(Form 19)Claim Status">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFSetStatus" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                    
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Pension(Form 10C)Claim Date">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFClmDate" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>
                    
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Pension(Form 10C)Claim Status">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFStatus" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>
                   
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EPF Pension(Form 10C)Claim Amount">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEPFAmount" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>
                   
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Total Claim Amount">
                    <ItemTemplate>
                        <asp:TextBox ID="txtTotClmAmount" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                    
                    <ControlStyle Width="200px"></ControlStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Remarks">
                    <ItemTemplate>
                        <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" 
                            Text='0' Width="100"></asp:TextBox>
                    </ItemTemplate>                    
                    <ControlStyle Width="300px"></ControlStyle>
                </asp:TemplateField>

            </Columns>
            <FooterStyle HorizontalAlign="Left" />
            <HeaderStyle HorizontalAlign="Left" />
            <RowStyle BackColor="#f5f5ef" />
        </asp:GridView>

    </div>

    <%----------------------------------%>



    <%--/*---Date Picker----*/--%>

<%--    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });
        function bindDatePickers(sender, args) {

         $('#<%= txtevedateofjoin.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>--%>

    <%--/*--------------------------------*/--%>


 

    <%--/*--------------------------------*/--%>


</asp:Content>

