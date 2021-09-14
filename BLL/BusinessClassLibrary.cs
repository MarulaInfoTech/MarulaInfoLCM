using System.Data;
using DAL;

namespace BLL
{
    public class BusinessClassLibrary
    {

    }

    public class ClsBusnssLayer
    {
        ClsDataLayer ObjectDA = new ClsDataLayer();

        // Company master
        public void InsertCmpData(string CmpCode, string CmpName, string CmpSec, string CmpStr, string CmpTown, string CmpCity, string CmpState, string CmpEmail, string CmpWeb, string CmpOff1, string CmpOff2, string CmpMob, string CmpFAX, string CmpGST, string CmpCST, string CmpECC, string CmpCn, string CmpESI, string CmpPF, string CmpPIN, string CmpDate)
        {
            ObjectDA.InsertCompData(CmpCode, CmpName, CmpSec, CmpStr, CmpTown, CmpCity, CmpState, CmpEmail, CmpWeb, CmpOff1, CmpOff2, CmpMob, CmpFAX, CmpGST, CmpCST, CmpECC, CmpCn, CmpESI, CmpPF, CmpPIN, CmpDate);
        }

        public void UpdateCmpData(string ID, string CmpCode, string CmpName, string CmpSec, string CmpStr, string CmpTown, string CmpCity, string CmpState, string CmpEmail, string CmpWeb, string CmpOff1, string CmpOff2, string CmpMob, string CmpFAX, string CmpGST, string CmpCST, string CmpECC, string CmpCn, string CmpESI, string CmpPF, string CmpPIN, string CmpDate)
        {
            ObjectDA.UpdateCompData(ID, CmpCode, CmpName, CmpSec, CmpStr, CmpTown, CmpCity, CmpState, CmpEmail, CmpWeb, CmpOff1, CmpOff2, CmpMob, CmpFAX, CmpGST, CmpCST, CmpECC, CmpCn, CmpESI, CmpPF, CmpPIN, CmpDate);
        }

        public DataTable SelectCompanyMaster()
        {

            return ObjectDA.SelectCompanyDetails();
        }


        public object SelectCompanyViewDetails(string CmpName)
        {
            return ObjectDA.SelectCompanyViewDetails(CmpName);
        }

        public DataTable SelectGetCompanyCode()
        {
            return ObjectDA.SelectGetCompanyCode();
        }


        public object SelectCompanyCheck(string CmpName, string CmpCST)
        {

            return ObjectDA.SelectCompanyCheck(CmpName, CmpCST);
        }

        // Clinet Detail
        public void InsertClntMasterData(string ClntCode, string ClntName, string Divi)
        {
            ObjectDA.InsertClntData(ClntCode, ClntName, Divi);
        }

        public void UpdateClntData(string ClntCode, string ClntName, string ClntID, string Divi)
        {
            ObjectDA.UpdateClntData(ClntCode, ClntName, ClntID, Divi);
        }

        public DataTable SelectClinet()
        {
            return ObjectDA.SelectClinet();
        }

        // State and City

        public object SelectCityData()
        {
            return ObjectDA.SelectCityData();
        }
        public void StateMasterInsertAndUpdate(string TypeId, string StateName, string CreateBy, string CreateDate)
        {
            ObjectDA.StateMasterInsertAndUpdate(TypeId, StateName, CreateBy, CreateDate);
        }
        //public void UpdateStateData(string StateName, string StateID)
        //{
        //    ObjectDA.UpdateStateData(StateName, StateID);        //}


        public void CityMasterInsertAndUpdate(string TypeId, string StateID, string CityName, string CreateBy, string CreateDate)
        {
            CityMasterInsertAndUpdate(TypeId, StateID, CityName, CreateBy, CreateDate);
        }
        public void UpdateCityData(string StateID, string CityName, string CityID)
        {
            ObjectDA.UpdateCityData(StateID, CityName, CityID);
        }
        public object SelectStateMaster()
        {
            return ObjectDA.SelectStateDetails();
        }

        public DataTable SelectCheckState(string StateName)
        {
            return ObjectDA.SelectCheckState(StateName);
        }

        public DataTable SelectCheckCityMasterOnState(string StateId, string CityName)
        {
            return ObjectDA.SelectCheckCityMasterOnState(StateId, CityName);
        }

        public object SelectCityOnStateData(string StateID)
        {
            return ObjectDA.SelectCityOnStateData(StateID);
        }


        //------------- LCM Clinet Detail 06-07-2020        
        public void InsertLcmClntData(string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
            string LcmCity, string LcmState, string LcmEnDate, string LcmPanno,
       string LcmGST, string LcmEpfno, string LcmEsino, string LcmRegno, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail, string LcmWeb, string LcmFromdt, string LcmTodt)
        {
            ObjectDA.InsertLcmClntData(ClntID, CmpID, LcmDiv, LcmSec, LcmStr, LcmTown,
                                    LcmCity, LcmState, LcmEnDate, LcmPanno,
                    LcmGST, LcmEpfno, LcmEsino, LcmRegno, LcmOff1, LcmMob, LcmHrNo, LcmAccNo, LcmEmail, LcmWeb, LcmFromdt, LcmTodt);
        }

        public void UpdateLcmClntData(string LCMId, string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
           string LcmCity, string LcmState, string LcmEnDate, string LcmPanno,
      string LcmGST, string LcmEpfno, string LcmEsino, string LcmRegno, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail, string LcmWeb, string LcmFromdt, string LcmTodt)
        {
            ObjectDA.UpdateLcmClntData(LCMId, ClntID, CmpID, LcmDiv, LcmSec, LcmStr, LcmTown,
                                    LcmCity, LcmState, LcmEnDate, LcmPanno,
                    LcmGST, LcmEpfno, LcmEsino, LcmRegno, LcmOff1, LcmMob, LcmHrNo, LcmAccNo, LcmEmail, LcmWeb, LcmFromdt, LcmTodt);
        }

        public DataTable SelectLCMClinet()
        {
            return ObjectDA.SelectLCMClinet();
        }

        public DataTable SelectLCMClientDetailID(string ClntID)
        {
            return ObjectDA.SelectLCMClientDetailID(ClntID);
        }
        //------------hari--------
        public DataTable CompanyDetailIDSelect(string COMPANYID)
        {
            return ObjectDA.CompanyDetailIDSelect(COMPANYID);

        }


        //------------- PEM Clinet Detail 11-07-2020     

        public void InsertPemClntData(string ClntID, string CmpID, string PemDiv, string PemSec, string PemStr, string PemTown,
            string PemCity, string PemState, string PemEnDate, string PemPANNO,
       string PemGST, string PemCST, string PemECC, string PemCode, string PemPFNo, string PemEsiNo, string PemOff1, string PemMob, string PemHrNo, string PemAccNo, string PemEmail, string PemWeb, string PemFromdt, string PemTodt)
        {
            ObjectDA.InsertPemClntData(ClntID, CmpID, PemDiv, PemSec, PemStr, PemTown,
             PemCity, PemState, PemEnDate, PemPANNO,
                        PemGST, PemCST, PemECC, PemCode, PemPFNo, PemEsiNo, PemOff1, PemMob, PemHrNo, PemAccNo, PemEmail, PemWeb, PemFromdt, PemTodt);
        }

        public void UpdatePemClntData(string PEMID, string ClntID, string CmpID, string PemDiv, string PemSec, string PemStr, string PemTown,
            string PemCity, string PemState, string PemEnDate, string PemPANNO,
       string PemGST, string PemCST, string PemECC, string PemCode, string PemPFNo, string PemEsiNo, string PemOff1, string PemMob, string PemHrNo, string PemAccNo, string PemEmail, string PemWeb, string PemFromdt, string PemTodt)
        {
            ObjectDA.UpdatePemClntData(PEMID, ClntID, CmpID, PemDiv, PemSec, PemStr, PemTown,
             PemCity, PemState, PemEnDate, PemPANNO,
                        PemGST, PemCST, PemECC, PemCode, PemPFNo, PemEsiNo, PemOff1, PemMob, PemHrNo, PemAccNo, PemEmail, PemWeb, PemFromdt, PemTodt);
        }

        public object SelectPEMClinet()
        {
            return ObjectDA.SelectPEMClinet();
        }

        public DataTable SelectPEMClientDetailView(string ClntID)
        {
            return ObjectDA.SelectPEMClientDetailView(ClntID);
        }



        //------------- CC Clinet Detail 11-07-2020     

        public void InsertCCClntData(string ClntID, string CmpID, string PemDiv, string PemSec, string PemStr, string PemTown,
        string PemCity, string PemState, string PemEnDate,
   string PemGST, string PemOff1, string PemMob, string PemHrNo, string PemAccNo, string PemEmail, 
   string PemWeb, string LcmEpfNo, string LcmEsiNo, string LcmRegNo, string PemFromdt, string PemTodt)
        {
            ObjectDA.InsertCCClntData(ClntID, CmpID, PemDiv, PemSec, PemStr, PemTown,
             PemCity, PemState, PemEnDate,
                        PemGST, PemOff1, PemMob, PemHrNo, PemAccNo, PemEmail, PemWeb, LcmEpfNo, LcmEsiNo, LcmRegNo, PemFromdt, PemTodt);
        }

        public void UpdateCCClntData(string CCID, string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
            string LcmCity, string LcmState, string LcmEnDate,
       string LcmGST, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail, 
       string LcmWeb, string LcmEpfNo, string LcmEsiNo, string LcmRegNo, string LcmFromdt, string LcmTodt)
        {
            ObjectDA.UpdateCCClntData(CCID, ClntID, CmpID, LcmDiv, LcmSec, LcmStr, LcmTown,
             LcmCity, LcmState, LcmEnDate,
                LcmGST, LcmOff1, LcmMob, LcmHrNo, LcmAccNo, LcmEmail, LcmWeb, LcmEpfNo, LcmEsiNo, LcmRegNo, LcmFromdt, LcmTodt);
        }
        public object SelectCCClinet()
        {
            return ObjectDA.SelectCCClinet();
        }

        public object SelectCCClientDetailView(string ClntName)
        {
            return ObjectDA.SelectCCClientDetailView(ClntName);
        }

        public DataTable SelectGetCCClient(string ClntID)
        {
            return ObjectDA.SelectGetCCClient(ClntID);
        }


        //------------- Department Detail 14-07-2020 
        public void InsertDptData(string DepCode, string deptName, string clntID)
        {
            ObjectDA.InsertDetData(DepCode, deptName, clntID);
        }
        public void UpdateDetData(string DepCode, string deptName, string clntID, string DepID)
        {
            ObjectDA.UpdateDetData(DepCode, deptName, clntID, DepID);
        }
        public DataTable SelectDepartment()
        {
            return ObjectDA.SelectDepartment();
        }

        public DataTable SelectDepartmentDept(string DeptName, string ClntID)
        {
            return ObjectDA.SelectDepartmentDept(DeptName, ClntID);
        }

        public object SelectDepartmentClnt(string ClntID)
        {
            return ObjectDA.SelectDepartmentClnt(ClntID);
        }

        public DataTable SelectDepartmentMasterIDMax(string ClntID)
        {
            return ObjectDA.SelectDepartmentMasterIDMax(ClntID);
        }

        //------------- Designstion Detail 11-07-2020 

        public void InsertDesignationData(string DesgCode, string DesgName, string ClntID)
        {
            ObjectDA.InsertDesignationData(DesgCode, DesgName, ClntID);
        }
        public DataTable SelectDesignationMasterID(string ClntID)
        {
            return ObjectDA.SelectDesignationMasterID(ClntID);
        }
        public object SelectDesignation()
        {
            return ObjectDA.SelectDesignation();
        }

        public object SelectDesignationMasterView(string DesgName)
        {
            return ObjectDA.SelectDesignationMasterView(DesgName);
        }

        public DataTable SelectDesignationMasterIDEx(string ClntID, string DesgName)
        {
            return ObjectDA.SelectDesignationMasterIDEx(ClntID, DesgName);
        }

        public void UpdateDesignationData(string DesgCode, string DesgName, string DesgID, string ClntID)
        {
            ObjectDA.UpdateDesignationData(DesgCode, DesgName, DesgID, ClntID);
        }


        //------------- Bank Detail 11-07-2020 
        public void InsertBankDetail(string BankName, string BankCode, string Branch, string Account, string Address, string Phoneno, string EmialId, string Others)
        {
            ObjectDA.InsertBankDetail(BankName, BankCode, Branch, Account, Address, Phoneno, EmialId, Others);
        }

        public void UpdateBankDetail(string BankID, string BankName, string BankCode, string Branch, string Account, string Address, string Phoneno, string EmialId, string Others)
        {
            ObjectDA.UpdateBankDetail(BankID, BankName, BankCode, Branch,
                Account, Address, Phoneno, EmialId, Others);
        }

        public object SelectBankDetail()
        {
            return ObjectDA.SelectBankDetail();
        }

        public DataTable SelectBankDetailCheck(string Account)
        {
            return ObjectDA.SelectBankDetailCheck(Account);
        }
        //------------- Account detail 12-02-2021

        public void InsertAccounYear(string FromDate, string ToDate, string AccYear)
        {
            ObjectDA.InsertAccounYear(FromDate, ToDate, AccYear);
        }
        public void UpdateAccounYear(string FromDate, string ToDate, string AccYear, string AccID)
        {
            ObjectDA.UpdateAccounYear(FromDate, ToDate, AccYear, AccID);
        }

        public DataTable SelectAccounYear()
        {
            return ObjectDA.SelectAccounYear();
        }

        //------------- Salary Detail 13-07-2020 
        public void InsertSalaryDetail(string ClntId, string Division, string Grade, string Basic, string Hra, string DA, string Convy, string Washing, string Others,
           string Total, string Otamt, string Special, string Bonus, string PF, string ESI, string Graduity, 
           string Leavewage, string OtHour, string OtHour2, string Otamt2, string OtHour3, string Otamt3)
        {
            ObjectDA.InsertSalaryDetail(ClntId, Division, Grade, Basic, Hra, DA, Convy, Washing, Others,
            Total, Otamt, Special, Bonus, PF, ESI, Graduity, Leavewage, OtHour, OtHour2, Otamt2, OtHour3, Otamt3);
        }

        public void UpdateSalaryDetail(string SaltId,  string ClntId, string Grade, string Basic, string Hra, string DA, string Convy, string Washing, string Others,
            string Total, string Otamt, string Special, string Bonus, string PF, string ESI, 
            string Graduity, string Leavewage, string OtHour, string OtHour2, string Otamt2, string OtHour3, string Otamt3)
        {
            ObjectDA.UpdateSalaryDetail(SaltId, ClntId, Grade, Basic, Hra, DA, Convy, Washing, Others,
            Total, Otamt, Special, Bonus, PF, ESI, Graduity, Leavewage, OtHour, OtHour2, Otamt2, OtHour3, Otamt3);
        }

        public object SelectSalaryDetailForUnit(string ClntId)
        {
            return ObjectDA.SelectSalaryDetailForUnit(ClntId);
        }

        public object SelectSalaryDetail()
        {
            return ObjectDA.SelectSalaryDetail();
        }

        public DataTable SelectSalaryDetailView(string Grade)
        {
            return ObjectDA.SelectSalaryDetailView(Grade);
        }

        //------------- PF and ESI Detail 04-08-2020 

        public object SelectPFDetail()
        {
            return ObjectDA.SelectPFDetail();
        }

        public object SelectESIDetail()
        {
            return ObjectDA.SelectESIDetail();
        }

        //------------- Qualification Detail 14-07-2020 
        public void InsertQualificationDetail(string Category, string Qualification, string Course, string CompanyId)
        {
            ObjectDA.InsertQualificationDetail(Category, Qualification, Course, CompanyId);
        }

        public void UpdateQualificationDetail(string QualiId, string Category, string Qualification, string Course, string CompanyId)
        {
            ObjectDA.UpdateQualificationDetail(QualiId, Category, Qualification, Course, CompanyId);
        }

        public object SelectQualyDetail()
        {
            return ObjectDA.SelectQualyDetail();
        }

        public object SelectQualificationDetailView(string Category)
        {
            return ObjectDA.SelectQualificationDetailView(Category);
        }

        public object SelectEducationDetail()
        {
            return ObjectDA.SelectEducationDetail();
        }

        public object SelectCategoryDetail(string Category)
        {
            return ObjectDA.SelectCategoryDetail(Category);
        }

        public object SelectCourseDetail(string Category, string Quali)
        {
            return ObjectDA.SelectCourseDetail(Category, Quali);
        }

        public DataTable SelectQualificationDetailCheck(string Course)
        {
            return ObjectDA.SelectQualificationDetailCheck(Course);
        }

        //-----------  Employee Application 16/07/2020
        public void InsertApplicationDetail(string ApplicaNo, string AppliDate, string AppliName, string Gender, string DOB, string Father, string Monther, string Guard, string Martial,
        string Sopuse, string PerStreet, string PerTown, string PerCity, string PerState, string PerPin, string PreStreet, string PreTown, string PreCity, string PreState,
            string PrePin, string Educat, string Quali, string Course, string Blood, string Mobile1, string Mobile2, string Adhar, string Pan, string Email)
        {
            ObjectDA.InsertApplicationDetail(ApplicaNo, AppliDate, AppliName, Gender, DOB, Father, Monther, Guard, Martial,
                        Sopuse, PerStreet, PerTown, PerCity, PerState, PerPin, PreStreet, PreTown, PreCity, PreState,
                                         PrePin, Educat, Quali, Course, Blood, Mobile1, Mobile2, Adhar, Pan, Email);
        }

        public void UpdateApplicationDetail(string ApplicaID, string ApplicaNo, string AppliDate, string AppliName, string Gender, string DOB, string Father, string Monther, string Guard, string Martial,
            string Sopuse, string PerStreet, string PerTown, string PerCity, string PerState, string PerPin, string PreStreet, string PreTown, string PreCity, string PreState,
            string PrePin, string Educat, string Quali, string Course, string Blood, string Mobile1, string Mobile2, string Adhar, string Pan, string Email)
        {
            ObjectDA.UpdateApplicationDetail(ApplicaID, ApplicaNo, AppliDate, AppliName, Gender, DOB, Father, Monther, Guard, Martial,
             Sopuse, PerStreet, PerTown, PerCity, PerState, PerPin, PreStreet, PreTown, PreCity, PreState,
             PrePin, Educat, Quali, Course, Blood, Mobile1, Mobile2, Adhar, Pan, Email);
        }

        public object SelectApplicationDetail()
        {
            return ObjectDA.SelectApplicationDetail();
        }

        public DataTable SelectApplicationCountForImport()
        {
            return ObjectDA.SelectApplicationCountForImport();

        }

        public DataTable SelectEmployeeCountForImport(string ClntId)
        {
            return ObjectDA.SelectEmployeeCountForImport(ClntId);
        }

        public void DeleteApplication(string AppID)
        {
            ObjectDA.DeleteApplication(AppID);
        }
        public DataTable SelectApplicationNoNamAdharCheck(string ApplicaNo, string ApplicaName, string Adharno)
        {
            return ObjectDA.SelectApplicationNoNamAdharCheck(ApplicaNo, ApplicaName, Adharno);
        }
        public DataTable SelectApplicationNoCheck(string ApplicaName, string Adharno)
        {
            return ObjectDA.SelectApplicationNoCheck(ApplicaName, Adharno);
        }


        public DataTable SelectSalaryMasterGradeCheck(string Grade, string ClntId)
        {
            return ObjectDA.SelectSalaryMasterGradeCheck(Grade, ClntId);
        }

        public DataTable SelectPFCheck(string PFName)
        {
            return ObjectDA.SelectPFCheck(PFName);
        }

        public DataTable SelectESICheck(string ESIName)
        {
            return ObjectDA.SelectESICheck(ESIName);
        }

        public DataTable SelectDepartmentMasterCheck(string DptName, string ClntId)
        {
            return ObjectDA.SelectDepartmentMasterCheck(DptName, ClntId);
        }

        public DataTable SelectDesignationMasterCheck(string DesgName)
        {
            return ObjectDA.SelectDesignationMasterCheck(DesgName);
        }

        public DataTable SelectEmployeeApplicationID(string AplliNo)
        {
            return ObjectDA.SelectEmployeeApplicationID(AplliNo);
        }

        public DataTable SelectCityAndStateID(string City, string State)
        {
            return ObjectDA.SelectCityAndStateID(City, State);
        }

        //-----------  Employee Interview 24/07/2020

        public DataTable SelectClientDetailID(string ClntID)
        {
            return ObjectDA.SelectClientDetailID(ClntID);
        } 

        public object SelectApplicationNoList()
        {
            return ObjectDA.SelectApplicationNoList();
        }

        public DataTable SelectInterviewApplicationNo()
        {
            return ObjectDA.SelectInterviewApplicationNo();
        }

        public void InsertInterviewDetails(string Date, string ApplicaID, string ClntID, string Division, string DesigID, string Status, string Feedback)
        {
            ObjectDA.InsertInterviewDetails(Date, ApplicaID, ClntID, Division, DesigID, Status, Feedback);
        }

        public void UpdateInterviewDetails(string IntID, string Date, string ApplicaID, string ClntID, string Division, string DesigID, string Status, string Feedback)
        {
            ObjectDA.UpdateInterviewDetails(IntID, Date, ApplicaID, ClntID, Division, DesigID, Status, Feedback);
        }

        public DataTable SelectApplicationIDDetail(string ApplicaID)
        {
            return ObjectDA.SelectApplicationIDDetail(ApplicaID);
        }

        public object SelectInterviewDetail()
        {
            return ObjectDA.SelectInterviewDetail();
        }

        public object SelectInterviewDetailView(string FrmDate, string ToDate, string ApplicaID)
        {
            return ObjectDA.SelectInterviewDetailView(FrmDate, ToDate, ApplicaID);
        }

        public object SelectResumeIdDetailView()
        {
            return ObjectDA.SelectResumeIdDetailView();
        }

        public void InsertEmployeeCompanyDetail(string ApplicaID, string EmpID, string DOB, string Jbtype, string Jbcat, string ClntID, string DptID, string DsgID,
            string DevID, string Wage, string BasicDA, string HRA, string Convey, string Washing, string Other, string TotHur, string OtAmt, string Contrac, string PFID,
            string UANNO, string PFNO, string ESIID, string ESINO, string TA, string Aadhar, string SlryType, string SlryIss, string IFSC, string Bank, string Branch,
            string Acc, string PANNO, string EmgName, string EmgRelaShip, string EmgMob, string EmgHome, string EmpIDMark, string PFName, string PFDate, string PFRelaShip,
            string PFStreet, string PFTown, string PFCity, string PFState, string PFPin, string PFMob, string PFHome, string ESIName, string ESIDate, string ESIRelaShip,
            string ESIStreet, string ESITown, string ESICity, string ESIState, string ESIPin, string ESIMob, string ESIHome, string RefName,
            string RefDesg, string RefMob, string RefName2, string RefDesg2, string RefMob2, string EmpStatus)
        {
                ObjectDA.InsertEmployeeCompanyDetail( ApplicaID,  EmpID,  DOB,  Jbtype,  Jbcat,  ClntID,  DptID,  DsgID, DevID,  Wage,  BasicDA,  HRA,  Convey,  
                    Washing,  Other,  TotHur,  OtAmt,  Contrac,  PFID, UANNO,  PFNO,  ESIID,  ESINO,  TA,  Aadhar,SlryType,  SlryIss,  IFSC,  Bank,  Branch,
             Acc, PANNO, EmgName,  EmgRelaShip,  EmgMob,  EmgHome,  EmpIDMark,  PFName,  PFDate,  PFRelaShip, PFStreet,  PFTown,  PFCity,  PFState,  PFPin,  PFMob,  
             PFHome,  ESIName,  ESIDate,  ESIRelaShip, ESIStreet,  ESITown,  ESICity,  ESIState,  ESIPin,  ESIMob,  ESIHome,  RefName, RefDesg,  RefMob,  RefName2, 
             RefDesg2,  RefMob2,  EmpStatus);
        }

        public object SelectApplicationNoDetail()
        {
            return ObjectDA.SelectApplicationNoDetail();
        }

        public void UpdateEmployeeApplicationFlagID(string AppID)
        {
             ObjectDA.UpdateEmployeeApplicationFlagID(AppID);
        }

        public DataTable SelectEmployeeCompanyDetailCode()
        {
            return ObjectDA.SelectEmployeeCompanyDetailCode();
        }

        public DataTable SelectSalaryMasterGrade(string Grade)
        {
            return ObjectDA.SelectSalaryMasterGrade(Grade);
        }

        public DataTable SelectApplicationNoMax()
        {
            return ObjectDA.SelectApplicationNoMax();
        }

        public DataTable SelectApplicationIDMax()
        {
            return ObjectDA.SelectApplicationIDMax();
        }

        public DataTable SelectEmployeeCode(string EmpCode)
        {
            return ObjectDA.SelectEmployeeCode(EmpCode);
        }

        public DataTable SelectEmployeeCompanyDetailReport()
        {
            return ObjectDA.SelectEmployeeCompanyDetailReport();
        }

        public object SelectCompanyDetailEdit(string FromDate, string ToDate, string ClntID, string DptName, string EmpCode)
        {
            return ObjectDA.SelectCompanyDetailEdit(FromDate, ToDate, ClntID, DptName, EmpCode);
        }
        public DataTable SelectCompanyDetailEditAll(string DptName, string EmpCode, string ClntName)
        {
            return ObjectDA.SelectCompanyDetailEditAll(DptName, EmpCode, ClntName);
        }
        public DataTable EmployeeCompanyDetailEditOnUnit(string DptName, string EmpCode, string ClnID)
        {
            return ObjectDA.EmployeeCompanyDetailEditOnUnit(DptName, EmpCode, ClnID);
        }
        public DataTable SelectCompanyDetailEditCode(string EmpCode)
        {
            return ObjectDA.SelectCompanyDetailEditCode(EmpCode);
        }

        public DataTable SelectCompanyDetailEditClient(string FromDate, string ToDate, string ClntName)
        {
            return ObjectDA.SelectCompanyDetailEditClient(FromDate, ToDate, ClntName);
        }

        public DataTable SelectAttendanceCountForMonth(string FromDate, string ToDate, string ClntName)
        {
            return ObjectDA.SelectAttendanceCountForMonth(FromDate, ToDate, ClntName);
        }

        public void DeleteEmployeeCompanyDetail(string EmpID, string ClntID)
        {
            ObjectDA.DeleteEmployeeCompanyDetail(EmpID, ClntID);
        }

        //-------- Employee Releave Detail 

        public void InsertEmployeeReleaving(string EntDate, string ReleavingDate, string Reason, string EmpId)
        {
            ObjectDA.InsertEmployeeReleaving(EntDate, ReleavingDate, Reason, EmpId);
        }

        public void UpdateEmployeeReleaving(string TypeId, string EntDate, string ReleavingDate, string Reason, string EmpId)
        {
            ObjectDA.UpdateEmployeeReleaving(TypeId, EntDate, ReleavingDate, Reason, EmpId);
        }

        public void UpdateEmployeeReleavingMaster(string Status, string EmpId)
        {
            ObjectDA.UpdateEmployeeReleavingMaster(Status, EmpId);
        }

        public object SelectEmployeeID()
        {
            return ObjectDA.SelectEmployeeID();
        }

        public object SelectEmployeeReleaving()
        {
            return ObjectDA.SelectEmployeeReleaving();
        }

        //-------- Attendance Entry
        public object SelectEmployeeAttendaceDetail(string ClntID)
        {
            return ObjectDA.SelectEmployeeAttendaceDetail(ClntID);
        }
        public void InsertDailyAttendane(string Date, string ClntID, string Division, string EmpID, string EmpCode, string DeptID, string WorkHour,
                                        string OtHours, string OtAmount, string BasicDA, string HRA, string Convey, string Wasing, string Other,
                                        string PFID, string ESIID, string RoomRent, string Insur, string OT1, string OT2, string OT3, string CompanyID, 
                                        string Status, string OtAmount2, string OtAmount3)
        {
            ObjectDA.InsertDailyAttendane(Date, ClntID, Division, EmpID, EmpCode, DeptID, WorkHour, OtHours, OtAmount, BasicDA, HRA, Convey, Wasing, Other,
                                         PFID, ESIID, RoomRent, Insur, OT1, OT2, OT3, CompanyID, Status, OtAmount2, OtAmount3);
        }

        public void DeleteAttendanceEntry(string Date, string EmpID, string ClntID)
        {
            ObjectDA.DeleteAttendanceEntry(Date, EmpID, ClntID);
        }

        public void DeleteMDAndETBreakUp(string FromDate, string ToDate, string ClntID)
        {
            ObjectDA.DeleteMDAndETBreakUp(FromDate, ToDate, ClntID);
        }

        public object SelectEmployeecheckMonthlyAttDetail(string ClntID)
        {
            return ObjectDA.SelectEmployeecheckMonthlyAttDetail(ClntID);
        }
        public DataTable SelectDailyAttendaneDetail(string FromDt, string ToDt, string ClntID, string DptName, string Empcode, string Jobtype,string Status)
        {
            return ObjectDA.SelectDailyAttendaneDetail(FromDt, ToDt, ClntID, DptName, Empcode, Jobtype, Status);
        }

        //-------

        public DataTable SelectDailyAttendaneEmployeeCode(string EmpCode)
        {
            return ObjectDA.SelectDailyAttendaneEmployeeCode(EmpCode);
        }

        public void Attendance12and25Insert(string EmpCode, string DptID, string ClnID, string Day1, string Day2, string Day3, string Day4,
            string Day5, string Day6, string Day7, string Day8, string Day9, string Day10, string Day11, string Day12, string Day13,
            string Day14, string Day15, string Day16, string Day17, string Day18, string Day19, string Day20,
            string Day21, string Day22, string Day23, string Day24, string Day25, string Day26, string Day27, string Day28,
            string Day29, string Day30, string Day31, string Ot1, string Ot2, string Ot3, string Ot4,
            string Ot5, string Ot6, string Ot7, string Ot8, string Ot9, string Ot10, string Ot11,
            string Ot12, string Ot13, string Ot14, string Ot15, string Ot16, string Ot17, string Ot18, string Ot19, string Ot20,
            string Ot21, string Ot22, string Ot23, string Ot24, string Ot25, string Ot26, string Ot27,
            string Ot28, string Ot29, string Ot30, string Ot31, string FrmDt, string ToDt, string Flag, string TotPre, string TotOT)
        {
            ObjectDA.Attendance12and25Insert(EmpCode, DptID, ClnID, Day1, Day2, Day3, Day4, Day5, Day6, Day7, Day8, Day9, Day10, Day11, Day12, Day13,
                Day14, Day15, Day16, Day17, Day18, Day19, Day20, Day21, Day22, Day23, Day24, Day25, Day26, Day27, Day28,
                Day29, Day30, Day31, Ot1, Ot2, Ot3, Ot4, Ot5, Ot6, Ot7, Ot8, Ot9, Ot10, Ot11,
                Ot12, Ot13, Ot14, Ot15, Ot16, Ot17, Ot18, Ot19, Ot20, Ot21, Ot22, Ot23, Ot24, Ot25, Ot26, Ot27,
                Ot28, Ot29, Ot30, Ot31, FrmDt, ToDt, Flag, TotPre, TotOT);
        }

        //--------

        public void DeleteDailyAttendane(string FromDate, string ToDate, string ClntID)
        {
            ObjectDA.DeleteDailyAttendane(FromDate, ToDate, ClntID);
        }

        public DataTable SelectDailyAttendaceCheck(string FromDate, string ToDate, string ClntID)
        {
            return ObjectDA.SelectDailyAttendaceCheck(FromDate, ToDate, ClntID);
        }
        public DataTable SelectEmployeeCompanyDetailCheckExl(string EmpCode, string ClntID)
        {
            return ObjectDA.SelectEmployeeCompanyDetailCheckExl(EmpCode, ClntID);
        }
        public DataTable SelectEmployeeCompanyDetailCheck(string EmpCode, string ClntID, string DOJ)
        {
            return ObjectDA.SelectEmployeeCompanyDetailCheck(EmpCode, ClntID, DOJ);
        }

        public DataTable SelectMonthlyAttendanceExport(string ClntID, string MonthYear)
        {
            return ObjectDA.SelectMonthlyAttendanceExport(ClntID, MonthYear);
        }

        public void DeletePerDailyAttendane(string Date, string EmpID, string ClntID)
        {
            ObjectDA.DeletePerDailyAttendane(Date, EmpID, ClntID);
        }

        //------- Allowance Description 21-05-2021

        public void InsertAllowanceDescription( string ClntID,  string DesCrip, string Code, string Types)
        {
            ObjectDA.InsertAllowanceDescription( ClntID, DesCrip, Code, Types);
        }

        public void UpdateAllowanceDescription(string AllDesID, string ClntID, string DesCrip, string Code, string Types)
        {
            ObjectDA.UpdateAllowanceDescription(AllDesID,ClntID, DesCrip, Code, Types);
        }

        public DataTable SelectAllowanceDescription()
        {
            return ObjectDA.SelectAllowanceDescription();
        }
        public DataTable SelectDeductionDescriptionID(string ClntID)
        {
            return ObjectDA.SelectDeductionDescriptionID(ClntID);
        }
        public DataTable SelectAllowanceDescriptionID(string ClntID)
        {
            return ObjectDA.SelectAllowanceDescriptionID(ClntID);
        }
        public DataTable SelectDeductionsForColumn(string FrmDate, string ToDate, string ClntID)
        {
            return ObjectDA.SelectDeductionsForColumn(FrmDate, ToDate, ClntID);
        }

        public DataTable SelectAllowanceForColumn(string FrmDate, string ToDate, string ClntID)
        {
            return ObjectDA.SelectAllowanceForColumn(FrmDate, ToDate, ClntID);
        }

        public DataTable AllowanceDescriptionCodeSelect(string ClntID, string Code)
        {
            return ObjectDA.AllowanceDescriptionCodeSelect(ClntID, Code);
        }

        //------- Allowance Detail 31-08-2020

        public void InsertAllowanceDetail(string Date, string EmpID, string EmpCode, string ClntID, string Divi,
            string DptID, string CmpID, string A1, string A2, string A3, string A4,
            string A5, string A6, string A7, string A8, string A9, string AD1, string AD2, string AD3, string AD4, string AD5,
            string AD6, string AD7, string AD8, string AD9)
        {
            ObjectDA.InsertAllowanceDetail(Date, EmpID, EmpCode, ClntID, Divi, DptID, CmpID, A1, A2, A3, A4,
             A5, A6, A7, A8, A9, AD1, AD2, AD3, AD4, AD5,
             AD6, AD7, AD8, AD9);
        }

        public object SelectAllowanceDetailFilter(string FromDate, string ToDate, string ClntID, string Divi)
        {
            return ObjectDA.SelectAllowanceDetailFilter(FromDate, ToDate, ClntID, Divi);
        }

        public void DeleteAllowanceDetail(string Date, string ClntID, string Divi)
        {
            ObjectDA.DeleteAllowanceDetail(Date, ClntID, Divi);
        }

        public object SelectAllowanceDetail()
        {
            return ObjectDA.SelectAllowanceDetail();
        }

        public DataTable SelectAllowanceFor(string ClntID, string DptName, string EmpCode)
        {
            return ObjectDA.SelectAllowanceFor(ClntID, DptName, EmpCode);
        }

        public DataTable SelectSetAllowanceDetail(string Date, string ClntID, string Divi)
        {
            return ObjectDA.SelectSetAllowanceDetail(Date, ClntID, Divi);
        }


        public void InsertDeductionDescription(string Description, string AllDesCode, string ClntID, string Types)
        {
            ObjectDA.InsertDeductionDescription(Description, AllDesCode, ClntID, Types);
        }
        public void UpdateDeductionDescription(string Description, string AllDesCode, string ClntID, string Types, string DesID)
        {
            ObjectDA.UpdateDeductionDescription(Description, AllDesCode, ClntID, Types, DesID);
        }

        public DataTable SelectDescription()
        {
            return ObjectDA.SelectDescription();
        }

        //-------- Deduction Detail 04-09-2020

        public void InsertDeductionDetail(string Date, string ClntID, string CmpID, string Divi, string TotD1,
            string TotD2, string TotD3, string TotD4,
                                            string TotD5, string TotD6, string TotD7, string TotD8, string Total)
        {
            ObjectDA.InsertDeductionDetail(Date, ClntID, CmpID, Divi, TotD1,
             TotD2, TotD3, TotD4, TotD5, TotD6, TotD7, TotD8, Total);
        }

        public object SelectEmployeeDeductionDetail()
        {
            return ObjectDA.SelectEmployeeDeductionDetail();
        }
        public object SelectEmployeeDeductionDetail(string ClntID)
        {
            return ObjectDA.SelectEmployeeDeductionDetail(ClntID);
        }

        public DataTable SelectDeductionEmployeeDetail(string DeductID)
        {
            return ObjectDA.SelectDeductionEmployeeDetail(DeductID);
        }
        public void InsertDeductionDtlDetail(string DeductID, string EmpID, string EmpCode, string CmpID, string D1, string D2, string D3, string D4,
                                           string D5, string D6, string D7, string D8, string Total, string DD1, string DD2, string DD3, string DD4,
                                           string DD5, string DD6, string DD7, string DD8)
        {
            ObjectDA.InsertDeductionDtlDetail(DeductID, EmpID, EmpCode, CmpID, D1, D2, D3, D4, D5, D6, D7, D8, Total, DD1, DD2, DD3, DD4,
                                            DD5, DD6, DD7, DD8);
        }

        public void DeleteDeductionDtlDetail(string DeductID)
        {
            ObjectDA.DeleteDeductionDtlDetail(DeductID);
        }

        public void UpdateDeductionDetail(string DeductID, string Date, string ClntID, string CmpID, string Divi, string TotD1,
            string TotD2, string TotD3, string TotD4,
                                            string TotD5, string TotD6, string TotD7, string TotD8, string Total)
        {
            ObjectDA.UpdateDeductionDetail(DeductID, Date, ClntID, CmpID, Divi, TotD1,
             TotD2, TotD3, TotD4, TotD5, TotD6, TotD7, TotD8, Total);
        }

        public DataTable SelectDeductionsID()
        {
            return ObjectDA.SelectDeductionsID();
        }

        // Payroll Monthly Detail

        public DataTable SelectPayrollMonthlyGenerate(string FromDate, string ToDate, string ClntID)
        {
            return ObjectDA.SelectPayrollMonthlyGenerate(FromDate, ToDate, ClntID);
        }

        public DataTable SelectPayrollMonthlyGenerateForReportJ(string FromDate, string ToDate, string ClntID)
        {
            return ObjectDA.SelectPayrollMonthlyGenerateForReportJ(FromDate, ToDate, ClntID);
        }

        public DataTable MonthlyPayrollIDSelect()
        {
            return ObjectDA.MonthlyPayrollIDSelect();
        }

        public DataTable MonthlyPayrollHdrForReportJIDSelect()
        {
            return ObjectDA.MonthlyPayrollHdrForReportJIDSelect();
        }

        public void InsertMonthlyPayrollHdr(string FromDate, string ToDate, string TotalDays, string ClntID, string NoEmp, string TotGross, string TotNet, string PFLimit, string TotWrkDays)
        {
            ObjectDA.InsertMonthlyPayrollHdr(FromDate, ToDate, TotalDays, ClntID, NoEmp, TotGross, TotNet, PFLimit, TotWrkDays);
        }

        public void InsertMonthlyPayrollHdrForReportJ(string FromDate, string ToDate, string TotalDays, string ClntID, string NoEmp, string TotGross, string TotNet, string PFLimit, string TotWrkDays)
        {
            ObjectDA.InsertMonthlyPayrollHdrForReportJ(FromDate, ToDate, TotalDays, ClntID, NoEmp, TotGross, TotNet, PFLimit, TotWrkDays);
        }

        public void InsertMonthlyPayrollDtl(string PayrollID, string EmpID, string EmpCode, string DptID, string DesdID, string WageType,
            string FixGrade, string WageDay, string EpfWageDay, string WrkDays, string ET1, string ET2, string ET3,
            string Basic, string Hra, string Convey, string Washing, string A1, string A2, string A3, string A4, string A5, string A6,
            string A7, string A8, string A9, string TotalWg, string OTAmount1, string OTAmount2, string OTAmount3, string TotExtra, string TotGross, string EpfWage, string Epf, string EsiWage,
            string Esi, string Advance, string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8,
            string TotDeduct, string Netwage)
        {
            ObjectDA.InsertMonthlyPayrollDtl( PayrollID,  EmpID,  EmpCode,  DptID,  DesdID,  WageType,
             FixGrade,  WageDay,  EpfWageDay,  WrkDays,  ET1,  ET2,  ET3,
             Basic,  Hra,  Convey,  Washing,  A1,  A2,  A3,  A4,  A5,  A6,
             A7,  A8,  A9,  TotalWg,  OTAmount1,  OTAmount2,  OTAmount3, TotExtra,  TotGross,  EpfWage,  Epf,  EsiWage,
             Esi,  Advance,  D1,  D2,  D3,  D4,  D5,  D6,  D7,  D8,
             TotDeduct,  Netwage);
        }

        public void InsertMonthlyPayrollDtlForReportJ(string PayrollID, string EmpID, string EmpCode, string DptID, string DesdID, string WageType,
            string FixGrade, string WageDay, string EpfWageDay, string WrkDays, string ET1, string ET2, string ET3,
            string Basic, string Hra, string Convey, string Washing, string A1, string A2, string A3, string A4, string A5, string A6,
            string A7, string A8, string A9, string TotalWg, string OTAmount1, string OTAmount2, string OTAmount3, string TotExtra, string TotGross, string EpfWage, string Epf, string EsiWage,
            string Esi, string Advance, string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8,
            string TotDeduct, string Netwage)
        {
            ObjectDA.InsertMonthlyPayrollDtlForReportJ(PayrollID, EmpID, EmpCode, DptID, DesdID, WageType,
             FixGrade, WageDay, EpfWageDay, WrkDays, ET1, ET2, ET3,
             Basic, Hra, Convey, Washing, A1, A2, A3, A4, A5, A6,
             A7, A8, A9, TotalWg, OTAmount1, OTAmount2, OTAmount3, TotExtra, TotGross, EpfWage, Epf, EsiWage,
             Esi, Advance, D1, D2, D3, D4, D5, D6, D7, D8,
             TotDeduct, Netwage);
        }

        public void InsertEmployeeTransfer(string Date, string EmpID, string EmpCode, string CurClntID, string CurDpt, string CurJbType, string ChngClntID, string ChngDpt, string ChngJbType
                                            , string Reason, string CurDesg, string ChngDesg)
        {
            ObjectDA.InsertEmployeeTransfer(Date, EmpID, EmpCode, CurClntID, CurDpt, CurJbType, ChngClntID, ChngDpt, ChngJbType
                                            , Reason, CurDesg, ChngDesg);
        }

        public void UpdateEmployeeTransfer(string EmpTranID, string Date, string EmpID, string EmpCode, string CurClntID, string CurDpt, string CurJbType, string ChngClntID, string ChngDpt, string ChngJbType
                                            , string Reason, string CurDesg, string ChngDesg)
        {

            ObjectDA.UpdateEmployeeTransfer(EmpTranID, Date, EmpID, EmpCode, CurClntID, CurDpt, CurJbType, ChngClntID, ChngDpt, ChngJbType
                                            , Reason, CurDesg, ChngDesg);
        }

        public void UpdateEmployeeTransferMaster(string ClntID, string DptID, string EmpID, string JbType)
        {
            ObjectDA.UpdateEmployeeTransferMaster(ClntID, DptID, EmpID, JbType);
        }

        public object SelectEmployeeTransfer()
        {
            return ObjectDA.SelectEmployeeTransfer();
        }

        public void DeleteMonthlyPayrollDtl(string FromDate, string ToDate, string ClntID)
        {
            ObjectDA.DeleteMonthlyPayrollDtl(FromDate, ToDate, ClntID);
        }

        public void DeleteMonthlyPayrollDtlForReportJ(string FromDate, string ToDate, string ClntID)
        {
            ObjectDA.DeleteMonthlyPayrollDtlForReportJ(FromDate, ToDate, ClntID);
        }
        public void DeleteMonthlyPayrollHdr(string FromDate, string ToDate, string ClntID)
        {
            ObjectDA.DeleteMonthlyPayrollHdr(FromDate, ToDate, ClntID);
        }

        public void DeleteMonthlyPayrollHdrForReportJ(string FromDate, string ToDate, string ClntID)
        {
            ObjectDA.DeleteMonthlyPayrollHdrForReportJ(FromDate, ToDate, ClntID);
        }

        //----- MDBreakUpReport


        public object SelectMDBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            return ObjectDA.SelectMDBreakUp(FrmDt, ToDt, ClntID);
        }

        public void DeleteMDBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            ObjectDA.DeleteMDBreakUp(FrmDt, ToDt, ClntID);
        }

        public void UpdateMDBreakUpConf(string FrmDt, string ToDt, string ClntID, string Flag)
        {
            ObjectDA.UpdateMDBreakUpConf(FrmDt, ToDt, ClntID, Flag);
        }

        //----- ETBreakUpReport

        public void DeleteETBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            ObjectDA.DeleteETBreakUp(FrmDt, ToDt, ClntID);
        }

        public object SelectETBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            return ObjectDA.SelectETBreakUp(FrmDt, ToDt, ClntID);
        }

        public void UpdateETBreakUpConf(string FrmDt, string ToDt, string ClntID, string Flag)
        {
            ObjectDA.UpdateETBreakUpConf(FrmDt, ToDt, ClntID, Flag);
        }

        // --Employee Report
        public DataSet SelectEmployeeReport(string FrmDt, string ToDt, string ClntID, string DtpID, string DesgID)
        {
            return ObjectDA.SelectEmployeeReport(FrmDt, ToDt, ClntID, DtpID, DesgID);
        }

        // --- PaySlip
        public DataTable SelectEmployeeCodeOnUnit(string ClntID)
        {
            return ObjectDA.SelectEmployeeCodeOnUnit(ClntID);
        }

        public DataSet SelectMonthlyPaySlip(string ClntID, string FrmDate, string ToDate, string EmpName)
        {
            return ObjectDA.SelectMonthlyPaySlip(ClntID, FrmDate, ToDate,  EmpName);
        }

        // Payment

        public void InsertPaymentDetail(string InvNo, string InvDt, string ClntName, string Div, string Grdtot, string SerTax, string NetAmt, string TDS,
            string Insur, string Canteen, string BillReCover, string Paid, string Balance, string Status, string ChequeNo, string Amount,
            string ChqDate, string ClrDate)
        {
            ObjectDA.InsertPaymentDetail(InvNo, InvDt, ClntName, Div, Grdtot, SerTax, NetAmt, TDS,
              Insur, Canteen, BillReCover, Paid, Balance, Status, ChequeNo, Amount,
              ChqDate, ClrDate);
        }

        public void UpdatePaymentDetail(string PayID, string InvNo, string InvDt, string ClntName, string Div, string Grdtot, string SerTax, string NetAmt, string TDS,
            string Insur, string Canteen, string BillReCover, string Paid, string Balance, string Status, string ChequeNo, string Amount,
            string ChqDate, string ClrDate)
        {
            ObjectDA.UpdatePaymentDetail(PayID, InvNo, InvDt, ClntName, Div, Grdtot, SerTax, NetAmt, TDS,
              Insur, Canteen, BillReCover, Paid, Balance, Status, ChequeNo, Amount,
              ChqDate, ClrDate);
        }

        public DataTable SelectPaymentDetail()
        {
            return ObjectDA.SelectPaymentDetail();
        }

        // Advance

        public void InsertAdvanceDetail(string Date, string AdvCode, string EmpID, string ClntID, string Amount, string Remark, string Status)
        {
            ObjectDA.InsertAdvanceDetail(Date, AdvCode, EmpID, ClntID, Amount, Remark, Status);
        }

        public void AdvanceDetailUpdate(string AdvID, string Date, string AdvCode, string EmpID, string ClntID, string Amount, string Remark, string Status)
        {
            ObjectDA.AdvanceDetailUpdate(AdvID, Date, AdvCode, EmpID, ClntID, Amount, Remark, Status);
        }

        public DataTable SelectAdvanceDetail()
        {
            return ObjectDA.SelectAdvanceDetail();
        }

        public DataTable SelectEmployeeName(string ClntID)
        {
            return ObjectDA.SelectEmployeeName(ClntID);
        }

        public DataTable SelectEmployeeNameDetail(string EmpID)
        {
            return ObjectDA.SelectEmployeeNameDetail(EmpID);
        }

        //----Petty Cash Reason

        public void PettyCashReasonInsert(string CASHREASON)
        {
            ObjectDA.PettyCashReasonInsert(CASHREASON);
        }

        public void PettyCashReasonUpdate(string CASHREASON, string DESID)
        {
            ObjectDA.PettyCashReasonUpdate(CASHREASON, DESID);
        }

        public DataTable PettyCashReasonSelect()
        {
          return ObjectDA.PettyCashReasonSelect();
        }

        // ---- Cash In

        public void InsertCashInDetail(string Date, string CashFm, string ClntName, string Divi, string Reason, string EmpCode, string Dept,
            string Remark, string TwoThou, string FiveHund, string TwoHund, string Hund, string Fifty, string Twenty, string Ten, string Five, string Two, string One, string Total)
        {
            ObjectDA.InsertCashInDetail(Date, CashFm, ClntName, Divi, Reason, EmpCode, Dept,
              Remark, TwoThou, FiveHund, TwoHund, Hund, Fifty, Twenty, Ten, Five, Two, One, Total);
        }

        public void UpdateCashInDetail(string CashId, string Date, string CashFm, string ClntName, string Divi, string Reason, string EmpCode, string Dept,
            string Remark, string TwoThou, string FiveHund, string TwoHund, string Hund, string Fifty, string Twenty, string Ten, string Five, string Two, string One, string Total)
        {
            ObjectDA.UpdateCashInDetail(CashId, Date, CashFm, ClntName, Divi, Reason, EmpCode, Dept,
              Remark, TwoThou, FiveHund, TwoHund, Hund, Fifty, Twenty, Ten, Five, Two, One, Total);
        }

        public DataTable SelectCashInDetail()
        {
            return ObjectDA.SelectCashInDetail();
        }

        public DataSet SelectCashInDetailReport()
        {
            return ObjectDA.SelectCashInDetailReport();
        }

        // ------ Cash Out

        public void InsertCashOutDetail(string TransID, string Date, string CashTo, string ClntName, string Dept, string Cash, string Remark,
           string AdvCode, string EmpName, string Divi, string EmpCode, string BillNo, string Amount,
             string HTwoThou, string HFiveHund, string HTwoHund, string HHund, string HFifty, string HTwenty, string HTen, string HFive, string HTwo,
             string HOne, string HTotal, string DTwoThou, string DFiveHund, string DTwoHund, string DHund, string DFifty, string DTwenty, string DTen, string DFive, string DTwo,
             string DOne, string DTotal)
        {
            ObjectDA.InsertCashOutDetail(TransID, Date, CashTo, ClntName, Dept, Cash, Remark,
             AdvCode, EmpName, Divi, EmpCode, BillNo, Amount, HTwoThou, HFiveHund, HTwoHund, HHund, HFifty, HTwenty, HTen, HFive, HTwo,
               HOne, HTotal, DTwoThou, DFiveHund, DTwoHund, DHund, DFifty, DTwenty, DTen, DFive, DTwo, DOne, DTotal);
        }


        public void UpdateCashOutDetail(string CashOutId, string TransID, string Date, string CashTo, string ClntName, string Dept, string Cash, string Remark,
           string AdvCode, string EmpName, string Divi, string EmpCode, string BillNo, string Amount,
             string HTwoThou, string HFiveHund, string HTwoHund, string HHund, string HFifty, string HTwenty, string HTen, string HFive, string HTwo,
             string HOne, string HTotal, string DTwoThou, string DFiveHund, string DTwoHund, string DHund, string DFifty, string DTwenty, string DTen, string DFive, string DTwo,
             string DOne, string DTotal)
        {
            ObjectDA.UpdateCashOutDetail(CashOutId, TransID, Date, CashTo, ClntName, Dept, Cash, Remark,
             AdvCode, EmpName, Divi, EmpCode, BillNo, Amount, HTwoThou, HFiveHund, HTwoHund, HHund, HFifty, HTwenty, HTen, HFive, HTwo,
               HOne, HTotal, DTwoThou, DFiveHund, DTwoHund, DHund, DFifty, DTwenty, DTen, DFive, DTwo, DOne, DTotal);
        }

        public DataTable SelectCashOutDetail()
        {
            return ObjectDA.SelectCashOutDetail();
        }


        public DataSet SelectCashOutDetailReport()
        {
            return ObjectDA.SelectCashOutDetailReport();
        }

        // ------ Income Entry

        public void InsertIncomeEntryDetail(string ClntID, string IncmMonth, string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
           string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            ObjectDA.InsertIncomeEntryDetail(ClntID, IncmMonth, CompName, Addr1, Addr2, Addr3, BillNo, Cont,
             BillSrcp, BillAmt, PayMode, Cheque, Date);
        }

        public void UpdateIncomeEntryDetail(string IncmID, string ClntID, string IncmMonth, string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
          string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            ObjectDA.UpdateIncomeEntryDetail(IncmID, ClntID, IncmMonth, CompName, Addr1, Addr2, Addr3, BillNo, Cont,
             BillSrcp, BillAmt, PayMode, Cheque, Date);
        }

        public DataTable SelectIncomeEntryDetail()
        {
            return ObjectDA.SelectIncomeEntryDetail();
        }

        // ------ Expenses Entry

        public void InsertExpensesEntryDetail(string ClntID, string ExpenMonth, string AvbBalance, string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
           string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            ObjectDA.InsertExpensesEntryDetail(ClntID, ExpenMonth, AvbBalance, CompName, Addr1, Addr2, Addr3, BillNo, Cont,
             BillSrcp, BillAmt, PayMode, Cheque, Date);
        }

        public void UpdateExpensesEntryDetail(string ExpenID, string ClntID, string ExpenMonth, string AvbBalance, string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
         string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            ObjectDA.UpdateExpensesEntryDetail(ExpenID, ClntID, ExpenMonth, AvbBalance, CompName, Addr1, Addr2, Addr3, BillNo, Cont,
             BillSrcp, BillAmt, PayMode, Cheque, Date);
        }

        public DataTable SelectExpensesEntryDetail()
        {
             return ObjectDA.SelectExpensesEntryDetail();
        }


        // ------ Expenses Entry 

        public void InsertInvoiceValueMaster(string ClntID, string PFWage, string ESIWage, string BonusWage, 
            string GratuWage, string LeaveWage, string LWF,string SerCharge, string CGST,
       string IGST, string SGST, string CESS, string TotalCharge)
        {
            ObjectDA.InsertInvoiceValueMaster(ClntID, PFWage, ESIWage, BonusWage, GratuWage, 
                LeaveWage, LWF, SerCharge, CGST,
         IGST, SGST, CESS, TotalCharge);

        }

        public void UpdateInvoiceValueMaster(string InvID, string ClntID, string PFWage, string ESIWage, 
            string BonusWage, string GratuWage, string LeaveWage, string LWF,string SerCharge, string CGST,
           string IGST, string SGST, string CESS, string TotalCharge)
        {
            ObjectDA.UpdateInvoiceValueMaster(InvID, ClntID, PFWage, ESIWage, BonusWage, GratuWage, 
                 LeaveWage, LWF, SerCharge, CGST,
                IGST, SGST, CESS, TotalCharge);
        }

        public DataTable SelectInvoiceValueMaster()
        {
            return ObjectDA.SelectInvoiceValueMaster();
        }

        public DataTable SelectInvoiceValueMasterClnt(string ClntID)
        {
            return ObjectDA.SelectInvoiceValueMasterClnt(ClntID);
        }

        // ------ Cash On Hand Entry 

        public void InsertCashOnHand(string Date, string S2000, string S500, string S200, string S100, string S50, string S20, string S10, string S5,
      string S2, string S1, string TotAmount, string Tot2000, string Tot500, string Tot200, string Tot100, string Tot50, string Tot20,
      string Tot10, string Tot5, string Tot2, string Tot1)
        {
            ObjectDA.InsertCashOnHand(Date, S2000, S500, S200, S100, S50, S20, S10, S5,
                        S2, S1, TotAmount, Tot2000, Tot500, Tot200, Tot100, Tot50, Tot20,
                        Tot10, Tot5, Tot2, Tot1);
        }

        public void UpdateCashOnHand(string CashID, string Date, string S2000, string S500, string S200, string S100, string S50, string S20, string S10, string S5,
      string S2, string S1, string TotAmount, string Tot2000, string Tot500, string Tot200, string Tot100, string Tot50, string Tot20,
      string Tot10, string Tot5, string Tot2, string Tot1)
        {
            ObjectDA.UpdateCashOnHand(CashID, Date, S2000, S500, S200, S100, S50, S20, S10, S5,
                        S2, S1, TotAmount, Tot2000, Tot500, Tot200, Tot100, Tot50, Tot20,
                        Tot10, Tot5, Tot2, Tot1);
        }

        public DataTable SelectCashOnHand()
        {
            return ObjectDA.SelectCashOnHand();
        }

        // ------ Department Value Setting Entry 

        public void InsertDepartmentValueMaster(string ClntID, string CmpID, string DayRate, string OTRate, string DptID)
        {
            ObjectDA.InsertDepartmentValueMaster(ClntID, CmpID, DayRate, OTRate, DptID);
        }

        public void UpdateDepartmentValueMaster(string DptValID, string ClntID, string CmpID, string DayRate, string OTRate, string DptID)
        {
            ObjectDA.UpdateDepartmentValueMaster(DptValID, ClntID, CmpID, DayRate, OTRate, DptID);
        }

        public DataTable SelectDepartmentValueMaster()
        {
            return ObjectDA.SelectCashOnHand();
        }

        //----- Regular Bill
        public DataTable SelectRegularBillCalc(string FrmDate, string ToDate, string ClntID)
        {
            return ObjectDA.SelectRegularBillCalc(FrmDate, ToDate, ClntID);
        }

        public DataSet SelectRegularBillCalcReport(string FrmDate, string ToDate, string ClntID, string InvNo, string InvDate)
        {
            return ObjectDA.SelectRegularBillCalcReport(FrmDate, ToDate, ClntID, InvNo, InvDate);
        }

        public DataSet SelectRegularBillId(string RgbId)
        {
            return ObjectDA.SelectRegularBillId(RgbId);
        }

        public DataTable SelectRegularBillHdrNo(string InvNo)
        {
            return ObjectDA.SelectRegularBillHdrNo(InvNo);
        }

        public void InsertRegularBillHdr(string InvNo, string InvDate, string ClntID, string WrkDay, string FrmDate, string Todate, string AccYear, string PfPer,
            string ESIPer, string BonPer, string GratPer, string LeavePer, string LTAPer, string OtherPer, string PfValue, string ESIValue,
            string BonValue, string GratValue, string LeaveValue, string LTAValue, string LWFValue, string OtherValue, string TotSatuPer,
            string TotSatuValue, string TotServPer, string TotServValue, string GrossTot, string GrandTot, string CGSTPer, string SGSTPer,
            string IGSTPer, string CessPer, string CGSTStatus, string SGSTStatus, string IGSTStatus, string CessStatus,
            string CGSTValue, string SGSTValue, string IGSTValue, string CessValue, string TotTax, string TotVal, string RoundUp,
            string Canteen, string Other, string NetAmount,string PFtatus, string ESIStatus, string BonusStatus, string GratuStatus,
            string LeaveStatus, string LTAStatus, string OtherStatus, string SreviceStatus)
        {
            ObjectDA.InsertRegularBillHdr( InvNo,  InvDate,  ClntID,  WrkDay,  FrmDate,  Todate, AccYear,  PfPer,
             ESIPer,  BonPer,  GratPer,  LeavePer,  LTAPer,  OtherPer,  PfValue,  ESIValue,
             BonValue,  GratValue,  LeaveValue,  LTAValue,  LWFValue,  OtherValue,  TotSatuPer,
             TotSatuValue,  TotServPer,  TotServValue,  GrossTot,  GrandTot,  CGSTPer,  SGSTPer,
             IGSTPer,  CessPer,  CGSTStatus,  SGSTStatus,  IGSTStatus,  CessStatus,
             CGSTValue,  SGSTValue,  IGSTValue,  CessValue,  TotTax,  TotVal,  RoundUp,
             Canteen,  Other,  NetAmount,  PFtatus,  ESIStatus,  BonusStatus,  GratuStatus, LeaveStatus,  LTAStatus,  OtherStatus, SreviceStatus);
        }

        public void UpdateRegularBillHdr(string RgbID, string InvNo, string InvDate, string ClntID, string WrkDay, string FrmDate, string Todate, string AccYear, string PfPer,
            string ESIPer, string BonPer, string GratPer, string LeavePer, string ServPer, string PfValue, string ESIValue, string BonValue, string GratValue, string LeaveValue, string ServValue,
            string TotServPer, string TotServValue, string TotIns, string GrossTot, string GrandTot, string CGSTPer, string SGSTPer, string IGSTPer, string CessPer,
            string CGSTValue, string SGSTValue, string IGSTValue, string CessValue, string NetAmount)
        {
                ObjectDA.UpdateRegularBillHdr(RgbID, InvNo, InvDate, ClntID, WrkDay, FrmDate, Todate, AccYear, PfPer,
                    ESIPer, BonPer, GratPer, LeavePer, ServPer, PfValue, ESIValue, BonValue, GratValue, LeaveValue, ServValue,
                    TotServPer, TotServValue, TotIns, GrossTot, GrandTot, CGSTPer, SGSTPer, IGSTPer, CessPer,
                    CGSTValue, SGSTValue, IGSTValue, CessValue, NetAmount);
        }

        public DataTable SelectRegularBillHdr()
        {
            return ObjectDA.SelectRegularBillHdr();
        }

        public DataTable SelectRegularBillDtl(string RgbID)
        {
            return ObjectDA.SelectRegularBillDtl(RgbID);
        }

        public void InsertRegularBillDtl(string RgbID, string EmpID, string EmpCode, string DptID, string DesdID, string WageType,
            string FixGrade, string WageDay, string EpfWageDay, string WrkDays, string ET1, string ET2, string ET3,
            string Basic, string Hra, string Convey, string Washing, string A1, string A2, string A3, string A4, string A5, string A6,
            string A7, string A8, string A9, string TotalWg, string OTAmount1, string OTAmount2, string OTAmount3, string TotExtra, string TotGross, string EpfWage, string Epf, string EsiWage,
            string Esi, string Advance, string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8,
            string TotDeduct, string Netwage)
        {
            ObjectDA.InsertRegularBillDtl( RgbID,  EmpID,  EmpCode,  DptID,  DesdID,  WageType,
             FixGrade,  WageDay,  EpfWageDay,  WrkDays,  ET1,  ET2,  ET3,
             Basic,  Hra,  Convey,  Washing,  A1,  A2,  A3,  A4,  A5,  A6,
             A7,  A8,  A9,  TotalWg,  OTAmount1,  OTAmount2,  OTAmount3,  TotExtra,  TotGross,  EpfWage,  Epf,  EsiWage,
             Esi,  Advance,  D1,  D2,  D3,  D4,  D5,  D6,  D7,  D8,
             TotDeduct,  Netwage);
        }

        public void DeleteRegularBillDtl(string RgbID)
        {
            ObjectDA.DeleteRegularBillDtl(RgbID);
        }

        public void DeleteRegularBillHdr(string RgbID)
        {
            ObjectDA.DeleteRegularBillHdr(RgbID);
        }

        public DataTable SelectRegularBillHdrMax()
        {
           return ObjectDA.SelectRegularBillHdrMax();
        }

        public DataTable SelectPayrollMonthly(string ClntId)
        {
            return ObjectDA.SelectPayrollMonthly(ClntId);
        }

        // MDandET Breakup
        public DataTable SelectMDAndETBreakUp(string FrmDt, string ToDt, string ClntId)
        {
            return ObjectDA.SelectMDAndETBreakUp(FrmDt, ToDt, ClntId);
        }
        public void InsertMDAndETBreakUp(string EmpCode, string DptID, string ClnID, string Day1, string Day2, string Day3, string Day4,
    string Day5, string Day6, string Day7, string Day8, string Day9, string Day10, string Day11, string Day12, string Day13,
    string Day14, string Day15, string Day16, string Day17, string Day18, string Day19, string Day20,
    string Day21, string Day22, string Day23, string Day24, string Day25, string Day26, string Day27, string Day28,
    string Day29, string Day30, string Day31, string Ot1, string Ot2, string Ot3, string Ot4,
    string Ot5, string Ot6, string Ot7, string Ot8, string Ot9, string Ot10, string Ot11,
    string Ot12, string Ot13, string Ot14, string Ot15, string Ot16, string Ot17, string Ot18, string Ot19, string Ot20,
    string Ot21, string Ot22, string Ot23, string Ot24, string Ot25, string Ot26, string Ot27,
    string Ot28, string Ot29, string Ot30, string Ot31, string FrmDt, string ToDt, string Flag, string TotPre, string TotOT)
        {
            ObjectDA.InsertMDAndETBreakUp(EmpCode, DptID, ClnID, Day1, Day2, Day3, Day4, Day5, Day6, Day7, Day8, Day9, Day10, Day11, Day12, Day13,
                Day14, Day15, Day16, Day17, Day18, Day19, Day20, Day21, Day22, Day23, Day24, Day25, Day26, Day27, Day28,
                Day29, Day30, Day31, Ot1, Ot2, Ot3, Ot4, Ot5, Ot6, Ot7, Ot8, Ot9, Ot10, Ot11,
                Ot12, Ot13, Ot14, Ot15, Ot16, Ot17, Ot18, Ot19, Ot20, Ot21, Ot22, Ot23, Ot24, Ot25, Ot26, Ot27,
                Ot28, Ot29, Ot30, Ot31, FrmDt, ToDt, Flag, TotPre, TotOT);
        }

        public DataSet SelectReport26For(string FrmDt, string ToDt, string ClntId)
        {
            return ObjectDA.SelectReport26For(FrmDt, ToDt, ClntId);
        }

        public DataSet ReportJforSelect(string FrmDt, string ToDt, string ClntId)
        {
            return ObjectDA.ReportJforSelect(FrmDt, ToDt, ClntId);
        }

        public DataSet SelectMonthlyPaySlip(string FrmDt, string ToDt, string ClntId)
        {
            return ObjectDA.SelectMonthlyPaySlip(FrmDt, ToDt, ClntId);
        }

        public DataSet SelectMonthlyPayrollForReportJ(string FrmDt, string ToDt, string ClntId)
        {
            return ObjectDA.SelectMonthlyPayrollForReportJ(FrmDt, ToDt, ClntId);
        }

        public DataTable SelectESIEstablishment(string ClntId)
        {
            return ObjectDA.SelectESIEstablishment(ClntId);
        }

        public DataTable PFGenerateSelect(string Month, string Year, string ClntId)
        {
            return ObjectDA.PFGenerateSelect(Month, Year, ClntId);
        }

        public DataTable PFGenerateSelectAll(string Month, string Year)
        {
            return ObjectDA.PFGenerateSelectAll(Month, Year);

        }

        public DataTable PFGenerateSelectAllForJ(string Month, string Year)
        {
            return ObjectDA.PFGenerateSelectAll(Month, Year);
        }

        public void InsertPfGenerateHdr(string PfMonth, string PfDate, string Types, string PreStrength, string MemAddition,
          string MemDeletion, string CurStrength, string ActStrength)
        {
             ObjectDA.InsertPfGenerateHdr(PfMonth, PfDate, Types, PreStrength, MemAddition,
              MemDeletion, CurStrength, ActStrength);
        }

        public DataTable PfGenerateHdrMaxSelect()
        {
            return ObjectDA.PfGenerateHdrMaxSelect();
        }

        public void InsertPfGenerateDtl(string PfId, string EmpId, string EmpCode, string ClntId, string NCPDay, string PFWage,
         string AC0, string AC1, string AC2, string AC10, string AC21, string AC22, string EmpShar, string Total)
        {
            ObjectDA.InsertPfGenerateDtl(PfId, EmpId, EmpCode, ClntId, NCPDay, PFWage,
            AC0, AC1, AC2, AC10, AC21, AC22, EmpShar, Total);
        }

        public DataTable PfGenerateBKGridshowBC()
        {
            return ObjectDA.PfGenerateBKGridshow();
        }

        public void UpdatePfGenerateHdr(string PfId, string PfMonth, string PfDate, string Types, string PreStrength, string MemAddition,
          string MemDeletion, string CurStrength, string ActStrength)
        {
            ObjectDA.UpdatePfGenerateHdr(PfId, PfMonth, PfDate, Types, PreStrength, MemAddition,
            MemDeletion, CurStrength, ActStrength);
        }

        public void DeletePfGenerateHdr(string PfId)
        {
            ObjectDA.DeletePfGenerateHdr(PfId);
        }


        public DataTable SelectPfGenerateDtl(string PFID)
        {
          return ObjectDA.SelectPfGenerateDtl(PFID);
        }


        // EPF Master

        public void PFMasterInsertBC(string PFNAME, string EPFContAC1, string EPSContAC10, string DiffBetEPFEPSAC1, string EDLIContAC21, string EPFChargeAC2, string EDLIChargeAC22, string RefundAC1, string Total)
        {
            ObjectDA.PFMasterInsertDC(PFNAME, EPFContAC1, EPSContAC10, DiffBetEPFEPSAC1, EDLIContAC21, EPFChargeAC2, EDLIChargeAC22, RefundAC1, Total);
        }

        public void PFMasterUpdateBC(string PFID, string PFNAME, string EPFContAC1, string EPSContAC10, string DiffBetEPFEPSAC1, string EDLIContAC21, string EPFChargeAC2, string EDLIChargeAC22, string RefundAC1, string Total)
        {
            ObjectDA.PFMasterUpdateDC(PFID, PFNAME, EPFContAC1, EPSContAC10, DiffBetEPFEPSAC1, EDLIContAC21, EPFChargeAC2, EDLIChargeAC22, RefundAC1, Total);
        }

        public DataTable PFMasterGridviewShowBC()
        {
            return ObjectDA.PFMasterGridviewShowDC();
        }


        // ESI Generate

        public DataTable SelectESIGenerate(string Month, string Year)
        {
            return ObjectDA.SelectESIGenerate(Month, Year);
        }


        public void InsertESIGenerateHdr(string ESIMonth, string ESIDate, string Types, string PreStrength, string MemAddition,
               string MemDeletion, string CurStrength, string ActStrength)
        {
            ObjectDA.InsertESIGenerateHdr(ESIMonth, ESIDate, Types, PreStrength, MemAddition,
                   MemDeletion, CurStrength, ActStrength);
        }

        public DataTable SelectESIGenerateHdrMax()
        {
            return ObjectDA.SelectESIGenerateHdrMax();
        }

        public void InsertESIGenerateDtl(string ESIId, string EmpId, string EmpCode, string ESIWage, string WrkDay,
           string ClntId, string Employee, string Employer, string Total)
        {
            ObjectDA.InsertESIGenerateDtl(ESIId, EmpId, EmpCode, ESIWage, WrkDay,
                  ClntId, Employee, Employer, Total);
        }

        public DataTable ESIGenerateGridshowBS()
        {
            return ObjectDA.ESIGenerateGridshowBS();
        }

        public void UpdateESIGenerateHdr(string ESIId, string ESIMonth, string ESIDate, string Types, string PreStrength, string MemAddition,
            string MemDeletion, string CurStrength, string ActStrength)
        {
            ObjectDA.UpdateESIGenerateHdr(ESIId, ESIMonth, ESIDate, Types, PreStrength, MemAddition,
                    MemDeletion, CurStrength, ActStrength);
        }

        public void DeleteESIGenerateDtl(string ESIId)
        {
            ObjectDA.DeleteESIGenerateDtl(ESIId);
        }

        public DataTable SelectESIGenerateDtl(string ESIId)
        {
           return ObjectDA.SelectESIGenerateDtl(ESIId);
        }


        // ESI Master

        //public void ESIMasterInsertBC(string ESINAME, string ESIEmployeeContribution, string ESIEmployerContribution)
        //{
        //    ObjectDA.ESIMasterInsertDC(ESINAME, ESIEmployeeContribution, ESIEmployerContribution);
        //}

        public void ESIMasterUpdateBC(string ESIID, string ESINAME, string ESIEmployeeContribution, string ESIEmployerContribution)
        {
            ObjectDA.ESIMasterUpdateDC(ESIID, ESINAME, ESIEmployeeContribution, ESIEmployerContribution);
        }

        public DataTable ESIMasterGridviewShowBC()
        {
            return ObjectDA.ESIMasterGridviewShowDC();
        }


        // GST Details

        //public DataTable GSTTaxFrontGridShowBC(string FromDate, string ToDate)
        //{
        //    return ObjectDA.GSTTaxFrontGridShowDC(FromDate, ToDate);
        //}

        public DataTable SelectGSTTax(string FromDate)
        {
            return ObjectDA.SelectGSTTax(FromDate);
        }

        public void GSTDetailsInsertBC(string GSTMonthID, string GSTMonth, string ChallanDate, string CodeNo, string PaymentMode, string BankName,
            string BranchName, string PreparedBy, string PaymentDate, string CGST, string IGST, string CESS, string SGST,
            string TotalGST, string PurchaseValue, string TotalPayabelGSTValue, string GSTPaymentStatus, string CIPNNo)
        {
            ObjectDA.GSTDetailsInsertDC(GSTMonthID, GSTMonth, ChallanDate, CodeNo, PaymentMode, BankName,
            BranchName, PreparedBy, PaymentDate, CGST, IGST, CESS, SGST, TotalGST, PurchaseValue,
            TotalPayabelGSTValue, GSTPaymentStatus, CIPNNo);
        }

        public DataTable GSTDetailsGridShowBC()
        {
            return ObjectDA.GSTDetailsGridShowDC();
        }

        public void GSTDetailsUpdateBC(string GSTID, string GSTMonthID, string GSTMonth, string ChallanDate, string CodeNo, string PaymentMode, string BankName,
                string BranchName, string PreparedBy, string PaymentDate, string CGST, string IGST, string CESS, string SGST,
                string TotalGST, string PurchaseValue, string TotalPayabelGSTValue, string GSTPaymentStatus, string CIPNNo)
        {
            ObjectDA.GSTDetailsUpdateDC(GSTID, GSTMonthID, GSTMonth, ChallanDate, CodeNo, PaymentMode, BankName,
                BranchName, PreparedBy, PaymentDate, CGST, IGST, CESS, SGST, TotalGST, PurchaseValue, TotalPayabelGSTValue, GSTPaymentStatus, CIPNNo);
        }

        public void GSTInvoiceDetailsInsertBC(string GSTID, string CLIENTID, string RGBID, string InvoiceNo, string InvoiceDate, string ClientName, string ClientGSTNo,
                    string Division, string InvoiceGrandTotal, string CGSTValue, string SGSTValue, string IGSTValue, string CESSValue, string TotalGSTAmount)
        {
            ObjectDA.GSTInvoiceDetailsInsertDC(GSTID, CLIENTID, RGBID, InvoiceNo, InvoiceDate, ClientName, ClientGSTNo, Division, InvoiceGrandTotal,
                      CGSTValue, SGSTValue, IGSTValue, CESSValue, TotalGSTAmount);
        }

        public DataTable GSTDetailsHdrMaxSelect()
        {
            return ObjectDA.GSTDetailsHdrMaxSelect();
        }

        public DataTable GSTCodeNoBC()
        {
            return ObjectDA.GSTCodeNoDC();
        }

        public void DeleteGStIdBC(string GSTId)
        {
            ObjectDA.DeleteGStIdDC(GSTId);
        }

        public DataTable GSTDetailsDtlGridShowBC(string GSTId)
        {
            return ObjectDA.GSTDetailsDtlGridShowDC(GSTId);
        }


        // Forms-25 Reports

        public DataSet Attendance12and25ForReportJSelect(string Fromdate, string Todate, string ClntId)
        {
            return ObjectDA.Attendance12and25ForReportJSelect(Fromdate, Todate, ClntId);
        }

        // Forms-B Reports

        public DataSet FormBReportSelect(string Fromdate, string Todate, string ClntId)
        {
            return ObjectDA.FormBReportSelect(Fromdate, Todate, ClntId);
        }



    }

}
