using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient; 
using System.Data;
using System.Configuration;
using System.Data.Sql;
using DAL;

namespace DAL
{
    public class DataClassLibrary
    {
        
    }
    public class ClsDataLayer
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));        
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();

        public void StateMasterInsertAndUpdate(string TypeId, string StateName, string CreateBy, string CreateDate)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(ServiceAction.StateMasterInsertAndUpdate, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(AdminData.TYPEID, SqlDbType.Int).Value = TypeId;
            cmd.Parameters.Add(AdminData.STATENAME, SqlDbType.VarChar).Value = StateName;
            cmd.Parameters.Add(AdminData.CREATEBY, SqlDbType.VarChar).Value = CreateBy;
            cmd.Parameters.Add(AdminData.CREATEDATE, SqlDbType.VarChar).Value = CreateDate;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
            }
            con.Close();
        }

        //public void UpdateStateData(string StateName,string StateID)
        //{
        //    con.Close();
        //    con.Open();
        //    cmd = new SqlCommand("StateMasterInsertAndUpdate", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.Add("@STATENAME", SqlDbType.VarChar).Value = StateName;
        //    cmd.Parameters.Add("@STATEID", SqlDbType.VarChar).Value = StateID;
        //    int i = cmd.ExecuteNonQuery();
        //    if (i > 0)
        //    {
        //    }
        //    con.Close();
        //}

        public DataTable SelectCheckState(string StateName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CheckStateSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@STATENAME", SqlDbType.VarChar).Value = StateName;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectStateDetails()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("StateMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //---------------CityMaster 03-07-2020

        public void CityMasterInsertAndUpdate(string TypeId, string StateID,string CityName, string CreateBy, string CreateDate)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand(ServiceAction.CityMasterInsertAndUpdate, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(AdminData.TYPEID, SqlDbType.VarChar).Value = TypeId;
            cmd.Parameters.Add(AdminData.STATEID, SqlDbType.VarChar).Value = StateID;
            cmd.Parameters.Add(AdminData.CITYNAME, SqlDbType.VarChar).Value = CityName;
            cmd.Parameters.Add(AdminData.CREATEBY, SqlDbType.VarChar).Value = CreateBy;
            cmd.Parameters.Add(AdminData.CREATEDATE, SqlDbType.VarChar).Value = CreateDate;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateCityData(string StateID, string CityName, string CityID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CityMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@STATEID", SqlDbType.VarChar).Value = StateID;
            cmd.Parameters.Add("@CITYNAME", SqlDbType.VarChar).Value = CityName;
            cmd.Parameters.Add("@CITYID", SqlDbType.VarChar).Value = CityID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectCityData()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CityMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectCheckCityMasterOnState(string StateId, string CityName)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CheckCityMasterOnStateSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = StateId;
            cmd.Parameters.Add("@CITYNAME", SqlDbType.VarChar).Value = CityName;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectCityOnStateData(string StateId)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CityMasterOnStateSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = StateId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //---------------PF and ESI Master 04-08-2020

        public object SelectPFDetail()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("PFDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectESIDetail()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //---------------CompanyMaster 03-07-2020
        public void InsertCompData(string CmpCode, string CmpName, string CmpSec, string CmpStr, string CmpTown, string CmpCity, string CmpState, string CmpEmail,
            string CmpWeb, string CmpOff1, string CmpOff2, string CmpMob, string CmpFAX, string CmpGST, string CmpCST, string CmpECC, string CmpCn, string CmpESI, 
            string CmpPF, string CmpPIN, string CmpDate)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CompanyMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@COMPANYCODE", SqlDbType.NVarChar).Value = CmpCode;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CmpName;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = CmpSec;
            cmd.Parameters.Add("@ADDRESS1", SqlDbType.NVarChar).Value = CmpStr;

            cmd.Parameters.Add("@ADDRESS2", SqlDbType.NVarChar).Value = CmpTown;
            cmd.Parameters.Add("@ADDRESS3", SqlDbType.NVarChar).Value = CmpCity;
            cmd.Parameters.Add("@ADDRESS4", SqlDbType.NVarChar).Value = CmpState;
            cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = CmpEmail;

            cmd.Parameters.Add("@WEB", SqlDbType.NVarChar).Value = CmpWeb;
            cmd.Parameters.Add("@OFFICENO1", SqlDbType.NVarChar).Value = CmpOff1;
            cmd.Parameters.Add("@OFFICENO2", SqlDbType.NVarChar).Value = CmpOff2;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = CmpMob;

            cmd.Parameters.Add("@FAXNO", SqlDbType.NVarChar).Value = CmpFAX;
            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = CmpGST;
            cmd.Parameters.Add("@CSTNO", SqlDbType.NVarChar).Value = CmpCST;
            cmd.Parameters.Add("@ECCNO", SqlDbType.NVarChar).Value = CmpECC;

            cmd.Parameters.Add("@CODENO", SqlDbType.NVarChar).Value = CmpCn;
            cmd.Parameters.Add("@ESI", SqlDbType.NVarChar).Value = CmpESI;
            cmd.Parameters.Add("@PF", SqlDbType.NVarChar).Value = CmpPF;
            cmd.Parameters.Add("@PINCODE", SqlDbType.NVarChar).Value = CmpPIN;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(CmpDate);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateCompData(string ID, string CmpCode, string CmpName, string CmpSec, string CmpStr, string CmpTown, string CmpCity, string CmpState, string CmpEmail,
            string CmpWeb, string CmpOff1, string CmpOff2, string CmpMob, string CmpFAX, string CmpGST, string CmpCST, string CmpECC, string CmpCn, string CmpESI,
            string CmpPF,string CmpPIN, string CmpDate)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CompanyMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = ID;
            cmd.Parameters.Add("@COMPANYCODE", SqlDbType.NVarChar).Value = CmpCode;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.VarChar).Value = CmpName;
            cmd.Parameters.Add("@SECTOR", SqlDbType.VarChar).Value = CmpSec;
            cmd.Parameters.Add("@ADDRESS1", SqlDbType.VarChar).Value = CmpStr;

            cmd.Parameters.Add("@ADDRESS2", SqlDbType.VarChar).Value = CmpTown;
            cmd.Parameters.Add("@ADDRESS3", SqlDbType.VarChar).Value = CmpCity;
            cmd.Parameters.Add("@ADDRESS4", SqlDbType.VarChar).Value = CmpState;
            cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = CmpEmail;

            cmd.Parameters.Add("@WEB", SqlDbType.VarChar).Value = CmpWeb;
            cmd.Parameters.Add("@OFFICENO1", SqlDbType.VarChar).Value = CmpOff1;
            cmd.Parameters.Add("@OFFICENO2", SqlDbType.VarChar).Value = CmpOff2;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.VarChar).Value = CmpMob;

            cmd.Parameters.Add("@FAXNO", SqlDbType.VarChar).Value = CmpFAX;
            cmd.Parameters.Add("@GSTNO", SqlDbType.VarChar).Value = CmpGST;
            cmd.Parameters.Add("@CSTNO", SqlDbType.VarChar).Value = CmpCST;
            cmd.Parameters.Add("@ECCNO", SqlDbType.VarChar).Value = CmpECC;

            cmd.Parameters.Add("@CODENO", SqlDbType.VarChar).Value = CmpCn;
            cmd.Parameters.Add("@ESI", SqlDbType.VarChar).Value = CmpESI;
            cmd.Parameters.Add("@PF", SqlDbType.VarChar).Value = CmpPF;
            cmd.Parameters.Add("@PINCODE", SqlDbType.NVarChar).Value = CmpPIN;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(CmpDate);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }
       
        public DataTable SelectCompanyDetails()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CompanyMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public object SelectCompanyViewDetails(string CmpName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CompanyMasterViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CmpName;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectCompanyCheck(string CmpName, string CmpCST)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CompanyMasterCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CmpName;
            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = CmpCST;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectGetCompanyCode()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GetCompanyCodeSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);            
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //---------------ClientMaster 03-07-2020

        public void InsertClntData(string ClntCode, string ClntName, string Divi)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("ClientMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTCODE", SqlDbType.NVarChar).Value = ClntCode;
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();

        }

        public void UpdateClntData(string ClntCode, string ClntName, string ClntID, string Divi)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("ClientMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTCODE", SqlDbType.NVarChar).Value = ClntCode;
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();

        }

        public DataTable SelectClinet()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ClientMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        //------------- LCM Clinet Detail 06-07-2020        

        public void InsertLcmClntData(string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
            string LcmCity, string LcmState, string LcmEnDate, string LcmPanno,
       string LcmGST, string LcmEpfno, string LcmEsino, string LcmRegno, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail, string LcmWeb, string LcmFromdt, string LcmTodt)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("LCMClientDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = LcmDiv;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = LcmSec;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.NVarChar).Value = LcmStr;
            cmd.Parameters.Add("@TOWN", SqlDbType.NVarChar).Value = LcmTown;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = LcmState;
            cmd.Parameters.Add("@CITYID", SqlDbType.NVarChar).Value = LcmCity;
            cmd.Parameters.Add("@ENDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmEnDate);

            cmd.Parameters.Add("@PANNO", SqlDbType.NVarChar).Value = LcmPanno;

            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = LcmGST;
            cmd.Parameters.Add("@EPFNO", SqlDbType.NVarChar).Value = LcmEpfno;
            cmd.Parameters.Add("@ESINO", SqlDbType.NVarChar).Value = LcmEsino;

            cmd.Parameters.Add("@REGNO", SqlDbType.NVarChar).Value = LcmRegno;

            cmd.Parameters.Add("@PHONENO", SqlDbType.NVarChar).Value = LcmOff1;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = LcmMob;
            cmd.Parameters.Add("@HRNO", SqlDbType.NVarChar).Value = LcmHrNo;
            cmd.Parameters.Add("@ACCNO", SqlDbType.NVarChar).Value = LcmAccNo;
            cmd.Parameters.Add("@EMAILID", SqlDbType.NVarChar).Value = LcmEmail;
            cmd.Parameters.Add("@WEBSITE", SqlDbType.NVarChar).Value = LcmWeb;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmFromdt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmTodt);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();

        }

        public void UpdateLcmClntData(string LCMId, string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
            string LcmCity, string LcmState, string LcmEnDate, string LcmPanno,
       string LcmGST, string LcmEpfno, string LcmEsino, string LcmRegno, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail, string LcmWeb, string LcmFromdt, string LcmTodt)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("LCMClientDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@LCMID", SqlDbType.NVarChar).Value = LCMId;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = LcmDiv;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = LcmSec;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.NVarChar).Value = LcmStr;
            cmd.Parameters.Add("@TOWN", SqlDbType.NVarChar).Value = LcmTown;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = LcmState;
            cmd.Parameters.Add("@CITYID", SqlDbType.NVarChar).Value = LcmCity;
            cmd.Parameters.Add("@ENDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmEnDate);

            cmd.Parameters.Add("@PANNO", SqlDbType.NVarChar).Value = LcmPanno;

            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = LcmGST;
            cmd.Parameters.Add("@EPFNO", SqlDbType.NVarChar).Value = LcmEpfno;
            cmd.Parameters.Add("@ESINO", SqlDbType.NVarChar).Value = LcmEsino;

            cmd.Parameters.Add("@REGNO", SqlDbType.NVarChar).Value = LcmRegno;
            cmd.Parameters.Add("@PHONENO", SqlDbType.NVarChar).Value = LcmOff1;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = LcmMob;
            cmd.Parameters.Add("@HRNO", SqlDbType.NVarChar).Value = LcmHrNo;
            cmd.Parameters.Add("@ACCNO", SqlDbType.NVarChar).Value = LcmAccNo;
            cmd.Parameters.Add("@EMAILID", SqlDbType.NVarChar).Value = LcmEmail;
            cmd.Parameters.Add("@WEBSITE", SqlDbType.NVarChar).Value = LcmWeb;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmFromdt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmTodt);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

             con.Close();

        }

        public DataTable SelectLCMClinet()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("LCMClientDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectLCMClientDetailID(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("LCMClientDetailIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable CompanyDetailIDSelect(string COMPANYID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CompanyDetailIDSelect", con);
            cmd.Parameters.Add("@COMPANYID", SqlDbType.Int).Value = COMPANYID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //------------- PEM Clinet Detail 11-07-2020  

        public void InsertPemClntData(string ClntID, string CmpID, string PemDiv, string PemSec, string PemStr, string PemTown,
            string PemCity, string PemState, string PemEnDate, string PemPANNO,
       string PemGST, string PemCST, string PemECC, string PemCode, string PemPFNo, string PemEsiNo, string PemOff1, string PemMob, string PemHrNo, string PemAccNo, string PemEmail, string PemWeb, string PemFromdt, string PemTodt)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("PEMClientDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = PemDiv;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = PemSec;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.NVarChar).Value = PemStr;
            cmd.Parameters.Add("@TOWN", SqlDbType.NVarChar).Value = PemTown;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = PemState;
            cmd.Parameters.Add("@CITYID", SqlDbType.NVarChar).Value = PemCity;
            cmd.Parameters.Add("@ENDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PemEnDate);

            cmd.Parameters.Add("@PANNO", SqlDbType.NVarChar).Value = PemPANNO;


            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = PemGST;
            cmd.Parameters.Add("@CSTNO", SqlDbType.NVarChar).Value = PemCST;
            cmd.Parameters.Add("@ECCNO", SqlDbType.NVarChar).Value = PemECC;
            cmd.Parameters.Add("@CODENO", SqlDbType.NVarChar).Value = PemCode;
            cmd.Parameters.Add("@PFNO", SqlDbType.NVarChar).Value = PemPFNo;
            cmd.Parameters.Add("@ESINO", SqlDbType.NVarChar).Value = PemEsiNo;

            cmd.Parameters.Add("@PHONENO", SqlDbType.NVarChar).Value = PemOff1;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = PemMob;
            cmd.Parameters.Add("@HRNO", SqlDbType.NVarChar).Value = PemHrNo;
            cmd.Parameters.Add("@ACCNO", SqlDbType.NVarChar).Value = PemAccNo;
            cmd.Parameters.Add("@EMAILID", SqlDbType.NVarChar).Value = PemEmail;
            cmd.Parameters.Add("@WEBSITE", SqlDbType.NVarChar).Value = PemWeb;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PemFromdt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PemTodt);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();

        }

        public void UpdatePemClntData(string PEMID,string ClntID, string CmpID, string PemDiv, string PemSec, string PemStr, string PemTown,
            string PemCity, string PemState, string PemEnDate, string PemPANNO,
       string PemGST, string PemCST, string PemECC, string PemCode, string PemPFNo, string PemEsiNo, string PemOff1, string PemMob, string PemHrNo, string PemAccNo, string PemEmail, string PemWeb, string PemFromdt, string PemTodt)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("PEMClientDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PEMID", SqlDbType.NVarChar).Value = PEMID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = PemDiv;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = PemSec;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.NVarChar).Value = PemStr;
            cmd.Parameters.Add("@TOWN", SqlDbType.NVarChar).Value = PemTown;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = PemState;
            cmd.Parameters.Add("@CITYID", SqlDbType.NVarChar).Value = PemCity;
            cmd.Parameters.Add("@ENDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PemEnDate);

            cmd.Parameters.Add("@PANNO", SqlDbType.NVarChar).Value = PemPANNO;
            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = PemGST;

            cmd.Parameters.Add("@CSTNO", SqlDbType.NVarChar).Value = PemCST;
            cmd.Parameters.Add("@ECCNO", SqlDbType.NVarChar).Value = PemECC;
            cmd.Parameters.Add("@CODENO", SqlDbType.NVarChar).Value = PemCode;
            cmd.Parameters.Add("@PFNO", SqlDbType.NVarChar).Value = PemPFNo;
            cmd.Parameters.Add("@ESINO", SqlDbType.NVarChar).Value = PemEsiNo;

            cmd.Parameters.Add("@PHONENO", SqlDbType.NVarChar).Value = PemOff1;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = PemMob;
            cmd.Parameters.Add("@HRNO", SqlDbType.NVarChar).Value = PemHrNo;
            cmd.Parameters.Add("@ACCNO", SqlDbType.NVarChar).Value = PemAccNo;
            cmd.Parameters.Add("@EMAILID", SqlDbType.NVarChar).Value = PemEmail;
            cmd.Parameters.Add("@WEBSITE", SqlDbType.NVarChar).Value = PemWeb;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PemFromdt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PemTodt);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();

        }

        public object SelectPEMClinet()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PEMClientDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable SelectPEMClientDetailView(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PEMClientDetailViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        //------------- CC Clinet Detail 11-07-2020 

        public void InsertCCClntData(string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
            string LcmCity, string LcmState, string LcmEnDate,
       string LcmGST, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail,
       string LcmWeb, string LcmEpfNo, string LcmEsiNo, string LcmRegNo, string LcmFromdt, string LcmTodt)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("CCClientDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = LcmDiv;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = LcmSec;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.NVarChar).Value = LcmStr;
            cmd.Parameters.Add("@TOWN", SqlDbType.NVarChar).Value = LcmTown;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = LcmState;
            cmd.Parameters.Add("@CITYID", SqlDbType.NVarChar).Value = LcmCity;
            cmd.Parameters.Add("@ENDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmEnDate);
            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = LcmGST;
            cmd.Parameters.Add("@PHONENO", SqlDbType.NVarChar).Value = LcmOff1;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = LcmMob;
            cmd.Parameters.Add("@HRNO", SqlDbType.NVarChar).Value = LcmHrNo;
            cmd.Parameters.Add("@ACCNO", SqlDbType.NVarChar).Value = LcmAccNo;
            cmd.Parameters.Add("@EMAILID", SqlDbType.NVarChar).Value = LcmEmail;
            cmd.Parameters.Add("@WEBSITE", SqlDbType.NVarChar).Value = LcmWeb;

            cmd.Parameters.Add("@EPFNO", SqlDbType.NVarChar).Value = LcmEpfNo;
            cmd.Parameters.Add("@ESINO", SqlDbType.NVarChar).Value = LcmEsiNo;
            cmd.Parameters.Add("@REGNO", SqlDbType.NVarChar).Value = LcmRegNo;


            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmFromdt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmTodt);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();

        }

        public void UpdateCCClntData(string CCID,string ClntID, string CmpID, string LcmDiv, string LcmSec, string LcmStr, string LcmTown,
            string LcmCity, string LcmState, string LcmEnDate,
       string LcmGST, string LcmOff1, string LcmMob, string LcmHrNo, string LcmAccNo, string LcmEmail, 
       string LcmWeb, string LcmEpfNo, string LcmEsiNo, string LcmRegNo, string LcmFromdt, string LcmTodt)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CCClientDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CCID", SqlDbType.NVarChar).Value = CCID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = LcmDiv;
            cmd.Parameters.Add("@SECTOR", SqlDbType.NVarChar).Value = LcmSec;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.NVarChar).Value = LcmStr;
            cmd.Parameters.Add("@TOWN", SqlDbType.NVarChar).Value = LcmTown;
            cmd.Parameters.Add("@STATEID", SqlDbType.NVarChar).Value = LcmState;
            cmd.Parameters.Add("@CITYID", SqlDbType.NVarChar).Value = LcmCity;
            cmd.Parameters.Add("@ENDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmEnDate);
            cmd.Parameters.Add("@GSTNO", SqlDbType.NVarChar).Value = LcmGST;
            cmd.Parameters.Add("@PHONENO", SqlDbType.NVarChar).Value = LcmOff1;
            cmd.Parameters.Add("@MOBILENO", SqlDbType.NVarChar).Value = LcmMob;
            cmd.Parameters.Add("@HRNO", SqlDbType.NVarChar).Value = LcmHrNo;
            cmd.Parameters.Add("@ACCNO", SqlDbType.NVarChar).Value = LcmAccNo;
            cmd.Parameters.Add("@EMAILID", SqlDbType.NVarChar).Value = LcmEmail;
            cmd.Parameters.Add("@WEBSITE", SqlDbType.NVarChar).Value = LcmWeb;

            cmd.Parameters.Add("@EPFNO", SqlDbType.NVarChar).Value = LcmEpfNo;
            cmd.Parameters.Add("@ESINO", SqlDbType.NVarChar).Value = LcmEsiNo;
            cmd.Parameters.Add("@REGNO", SqlDbType.NVarChar).Value = LcmRegNo;

            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmFromdt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(LcmTodt);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectCCClinet()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CCClientDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectCCClientDetailView(string ClntName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CCClientDetailViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.VarChar).Value = ClntName;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectGetCCClient(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GetCCClientSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        //------------- Department Detail 11-07-2020 
        public void InsertDetData(string DepCode, string deptName, string clntID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEPARTMENTCODE", SqlDbType.VarChar).Value = DepCode;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.VarChar).Value = deptName;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = clntID;            
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateDetData(string DepCode, string deptName, string clntID, string DepID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.VarChar).Value = DepID;
            cmd.Parameters.Add("@DEPARTMENTCODE", SqlDbType.VarChar).Value = DepCode;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.VarChar).Value = deptName;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = clntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public DataTable SelectDepartment()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }
        
        public object SelectDepartmentClnt(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterSelectClnt", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectDepartmentDept(string DeptName, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterSelectDept", con);
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.VarChar).Value = DeptName;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectDepartmentMasterIDMax(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterIDMaxSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //------------- Designation Detail 11-07-2020 


        public void InsertDesignationData(string DesgCode, string DesgName, string ClntID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DESIGNATIONNAME", SqlDbType.VarChar).Value = DesgName;
            cmd.Parameters.Add("@DESIGNATIONCODE", SqlDbType.VarChar).Value = DesgCode;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateDesignationData(string DesgCode, string DesgName, string DesgID, string ClntID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.VarChar).Value = DesgID;
            cmd.Parameters.Add("@DESIGNATIONNAME", SqlDbType.VarChar).Value = DesgName;
            cmd.Parameters.Add("@DESIGNATIONCODE", SqlDbType.VarChar).Value = DesgCode;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public DataTable SelectDesignationMasterID(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectDesignationMasterIDEx(string ClntID, string DesgName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterIDExSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DESIGNATIONNAME", SqlDbType.VarChar).Value = DesgName;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public object SelectDesignation()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectDesignationMasterView(string DesgName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DESIGNATIONNAME", SqlDbType.VarChar).Value = DesgName;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }
         

        //------------- Bank Detail 11-07-2020 


        public void InsertBankDetail(string BankName, string BankCode, string Branch, string Account, string Address, string Phoneno, string EmialId, string Others)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("BankDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BANKNAME", SqlDbType.VarChar).Value = BankName;
            cmd.Parameters.Add("@BANKCODE", SqlDbType.VarChar).Value = BankCode;
            cmd.Parameters.Add("@BRANCH", SqlDbType.VarChar).Value = Branch;
            cmd.Parameters.Add("@ACCOUNTNUMBER", SqlDbType.VarChar).Value = Account;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.VarChar).Value = Address;
            cmd.Parameters.Add("@PHONENO", SqlDbType.VarChar).Value = Phoneno;
            cmd.Parameters.Add("@EMAILID", SqlDbType.VarChar).Value = EmialId;
            cmd.Parameters.Add("@OTHER", SqlDbType.VarChar).Value = Others;


            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }


        public void UpdateBankDetail(string BankID, string BankName, string BankCode, string Branch, string Account, string Address, string Phoneno, string EmialId, string Others)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("BankDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BANKID", SqlDbType.VarChar).Value = BankID;
            cmd.Parameters.Add("@BANKNAME", SqlDbType.VarChar).Value = BankName;
            cmd.Parameters.Add("@BANKCODE", SqlDbType.VarChar).Value = BankCode;
            cmd.Parameters.Add("@BRANCH", SqlDbType.VarChar).Value = Branch;
            cmd.Parameters.Add("@ACCOUNTNUMBER", SqlDbType.VarChar).Value = Account;
            cmd.Parameters.Add("@ADDRESS", SqlDbType.VarChar).Value = Address;
            cmd.Parameters.Add("@PHONENO", SqlDbType.VarChar).Value = Phoneno;
            cmd.Parameters.Add("@EMAILID", SqlDbType.VarChar).Value = EmialId;
            cmd.Parameters.Add("@OTHER", SqlDbType.VarChar).Value = Others;


            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectBankDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("BankDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectBankDetailCheck(string Account)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("BankDetailCheckSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ACCOUNTNUMBER", SqlDbType.VarChar).Value = Account;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }
        //------------- Account Year Detail

        public void InsertAccounYear(string FromDate, string ToDate, string AccYear)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("AccounYearInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@ACCOUNTYEAR", SqlDbType.VarChar).Value = AccYear;            
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateAccounYear(string FromDate, string ToDate, string AccYear, string AccID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("AccounYearUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@ACCOUNTYEAR", SqlDbType.NVarChar).Value = AccYear;
            cmd.Parameters.Add("@ACCYEARID", SqlDbType.Int).Value = AccID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }


        public DataTable SelectAccounYear()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AccounYearSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //------------- Salary Detail 11-07-2020 

        public void InsertSalaryDetail(string ClntId, string Division, string Grade, string Basic, string Hra, string DA, string Convy, string Washing, string Others,
            string Total, string Otamt, string Special, string Bonus, string PF, string ESI, 
            string Graduity, string Leavewage, string OtHour, string OtHour2, string Otamt2, string OtHour3, string Otamt3)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Division;

            cmd.Parameters.Add("@GRADE", SqlDbType.NVarChar).Value = Grade;
            cmd.Parameters.Add("@BASIC", SqlDbType.Decimal).Value = Basic;
            cmd.Parameters.Add("@HRA", SqlDbType.Decimal).Value = Hra;
            cmd.Parameters.Add("@DA", SqlDbType.Decimal).Value = DA;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.Decimal).Value = Convy;
            cmd.Parameters.Add("@WASHING", SqlDbType.Decimal).Value = Washing;
            cmd.Parameters.Add("@OTHER", SqlDbType.Decimal).Value = Others;
            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = Total;
            cmd.Parameters.Add("@SPECIAL", SqlDbType.Decimal).Value = Special;
            cmd.Parameters.Add("@BONUS", SqlDbType.Decimal).Value = Bonus;
            cmd.Parameters.Add("@PF", SqlDbType.Decimal).Value = PF;
            cmd.Parameters.Add("@ESI", SqlDbType.Decimal).Value = ESI;
            cmd.Parameters.Add("@GRADUITY", SqlDbType.Decimal).Value = Graduity;
            cmd.Parameters.Add("@LEAVEWAGE", SqlDbType.Decimal).Value = Leavewage;

            cmd.Parameters.Add("@OTHOUR", SqlDbType.Decimal).Value = OtHour;
            cmd.Parameters.Add("@OTAMOUNT", SqlDbType.Decimal).Value = Otamt;
            cmd.Parameters.Add("@OTHOUR2", SqlDbType.Decimal).Value = OtHour2;
            cmd.Parameters.Add("@OTAMOUNT2", SqlDbType.Decimal).Value = Otamt2;
            cmd.Parameters.Add("@OTHOUR3", SqlDbType.Decimal).Value = OtHour3;
            cmd.Parameters.Add("@OTAMOUNT3", SqlDbType.Decimal).Value = Otamt3;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateSalaryDetail(string SaltId, string ClntId, string Grade, string Basic, string Hra, string DA, string Convy, string Washing, string Others,
            string Total, string Otamt, string Special, string Bonus, string PF, string ESI, string Graduity, 
            string Leavewage, string OtHour, string OtHour2, string Otamt2, string OtHour3, string Otamt3)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SALARYID", SqlDbType.Int).Value = SaltId;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            cmd.Parameters.Add("@GRADE", SqlDbType.NVarChar).Value = Grade;
            cmd.Parameters.Add("@BASIC", SqlDbType.Decimal).Value = Basic;
            cmd.Parameters.Add("@HRA", SqlDbType.Decimal).Value = Hra;
            cmd.Parameters.Add("@DA", SqlDbType.Decimal).Value = DA;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.Decimal).Value = Convy;
            cmd.Parameters.Add("@WASHING", SqlDbType.Decimal).Value = Washing;
            cmd.Parameters.Add("@OTHER", SqlDbType.Decimal).Value = Others;
            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = Total;
            cmd.Parameters.Add("@OTAMOUNT", SqlDbType.Decimal).Value = Otamt;
            cmd.Parameters.Add("@SPECIAL", SqlDbType.Decimal).Value = Special;
            cmd.Parameters.Add("@BONUS", SqlDbType.Decimal).Value = Bonus;
            cmd.Parameters.Add("@PF", SqlDbType.Decimal).Value = PF;
            cmd.Parameters.Add("@ESI", SqlDbType.Decimal).Value = ESI;
            cmd.Parameters.Add("@GRADUITY", SqlDbType.Decimal).Value = Graduity;
            cmd.Parameters.Add("@LEAVEWAGE", SqlDbType.Decimal).Value = Leavewage;
            cmd.Parameters.Add("@OTHOUR", SqlDbType.Decimal).Value = OtHour;

            cmd.Parameters.Add("@OTHOUR2", SqlDbType.Decimal).Value = OtHour2;
            cmd.Parameters.Add("@OTAMOUNT2", SqlDbType.Decimal).Value = Otamt2;
            cmd.Parameters.Add("@OTHOUR3", SqlDbType.Decimal).Value = OtHour3;
            cmd.Parameters.Add("@OTAMOUNT3", SqlDbType.Decimal).Value = Otamt3;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectSalaryDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryDetailSelect", con);           
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectSalaryDetailView(string Grade)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryDetailViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.Add("@GRADE", SqlDbType.VarChar).Value = Grade;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectSalaryDetailForUnit(string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryDetailForUnitSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //------------- Qualification Detail 14-07-2020 

        public void InsertQualificationDetail(string Category, string Qualification, string Course, string CompanyId)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("QualificationDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CATEGORY", SqlDbType.VarChar).Value = Category;
            cmd.Parameters.Add("@QUALIFICATION", SqlDbType.VarChar).Value = Qualification;
            cmd.Parameters.Add("@COURSE", SqlDbType.VarChar).Value = Course;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.VarChar).Value = CompanyId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateQualificationDetail(string QualiId,string Category, string Qualification, string Course, string CompanyId)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("QualificationDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@QUALIFICATIONID", SqlDbType.VarChar).Value = QualiId;
            cmd.Parameters.Add("@CATEGORY", SqlDbType.VarChar).Value = Category;
            cmd.Parameters.Add("@QUALIFICATION", SqlDbType.VarChar).Value = Qualification;
            cmd.Parameters.Add("@COURSE", SqlDbType.VarChar).Value = Course;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.VarChar).Value = CompanyId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }
        public object SelectQualyDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("QualificationDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectQualificationDetailView(string Category)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("QualificationDetailViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CATEGORY", SqlDbType.VarChar).Value = Category;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectEducationDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EducationDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }
       

        public object SelectCategoryDetail(string Category)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CategoryDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CATEGORY", SqlDbType.VarChar).Value = Category;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectCourseDetail(string Category, string Quali)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CourseDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CATEGORY", SqlDbType.VarChar).Value = Category;
            cmd.Parameters.Add("@QUALIFICATION", SqlDbType.VarChar).Value = Quali;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectQualificationDetailCheck(string Course)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("QualificationDetailCheckSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@COURSE", SqlDbType.VarChar).Value = Course;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // EmployeeMaster 16/07/2020

        public void InsertApplicationDetail(string ApplicaNo, string AppliDate, string AppliName, string Gender, string DOB, string Father, string Monther, string Guard, string Martial, 
            string Sopuse, string PerStreet, string PerTown, string PerCity, string PerState, string PerPin, string PreStreet, string PreTown, string PreCity, string PreState,
            string PrePin, string Educat,string Quali, string Course, string Blood, string Mobile1, string Mobile2, string Adhar, string Pan, string Email)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONNO", SqlDbType.NVarChar).Value = ApplicaNo;
            cmd.Parameters.Add("@APPLICATIONDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(AppliDate);
            cmd.Parameters.Add("@APPLICATIONAME", SqlDbType.NVarChar).Value = AppliName;
            cmd.Parameters.Add("@GENDER", SqlDbType.NVarChar).Value = Gender;
            if (DOB == "&nbsp;")
            { cmd.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = ""; }
            else
            { cmd.Parameters.Add("@DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(DOB); }
            
            cmd.Parameters.Add("@FATHERNAME", SqlDbType.NVarChar).Value = Father;
            cmd.Parameters.Add("@MOTHERNAME", SqlDbType.NVarChar).Value = Monther;
            cmd.Parameters.Add("@GUARDIANNAME", SqlDbType.NVarChar).Value = Guard;
            cmd.Parameters.Add("@MARTIALSTATUS", SqlDbType.NVarChar).Value = Martial;
            cmd.Parameters.Add("@SPOUSENAME", SqlDbType.NVarChar).Value = Sopuse;
            cmd.Parameters.Add("@PERMANENTNOANDSTREET", SqlDbType.NVarChar).Value = PerStreet;
            cmd.Parameters.Add("@PERMANENTTOWN", SqlDbType.NVarChar).Value = PerTown;
            cmd.Parameters.Add("@PERMANENTCITY", SqlDbType.NVarChar).Value = PerCity;
            cmd.Parameters.Add("@PERMANENTSTATEID", SqlDbType.NVarChar).Value = PerState;
            cmd.Parameters.Add("@PERMANENTPINCODE", SqlDbType.NVarChar).Value = PerPin;
            cmd.Parameters.Add("@PRESENTNOANDSTREET", SqlDbType.NVarChar).Value = PreStreet;
            cmd.Parameters.Add("@PRESENTTOWN", SqlDbType.NVarChar).Value = PreTown;
            cmd.Parameters.Add("@PRESENTCITY", SqlDbType.NVarChar).Value = PreCity;
            cmd.Parameters.Add("@PRESENTSTATEID", SqlDbType.NVarChar).Value = PreState;
            cmd.Parameters.Add("@PRESENTPINCODE", SqlDbType.NVarChar).Value = PrePin;
            cmd.Parameters.Add("@EDUCATIONCAT", SqlDbType.NVarChar).Value = Educat;
            cmd.Parameters.Add("@QUALIFICATION", SqlDbType.NVarChar).Value = Quali;
            cmd.Parameters.Add("@COURSE", SqlDbType.NVarChar).Value = Course;
            cmd.Parameters.Add("@BLOODGROUP", SqlDbType.NVarChar).Value = Blood;
            cmd.Parameters.Add("@MOBILENO1", SqlDbType.NVarChar).Value = Mobile1;
            cmd.Parameters.Add("@MOBILENO2", SqlDbType.NVarChar).Value = Mobile2;
            cmd.Parameters.Add("@ADHARNO", SqlDbType.NVarChar).Value = Adhar;
            cmd.Parameters.Add("@PANNO", SqlDbType.NVarChar).Value = Pan;
            //cmd.Parameters.Add("@EMPPHOTO", SqlDbType.VarChar).Value = Course;
            cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = Email;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateApplicationDetail(string ApplicaID, string ApplicaNo, string AppliDate, string AppliName, string Gender, string DOB, string Father, string Monther, string Guard, string Martial,
            string Sopuse, string PerStreet, string PerTown, string PerCity, string PerState, string PerPin, string PreStreet, string PreTown, string PreCity, string PreState,
            string PrePin, string Educat, string Quali, string Course, string Blood, string Mobile1, string Mobile2, string Adhar, string Pan, string Email)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.NVarChar).Value = ApplicaID;
            cmd.Parameters.Add("@APPLICATIONNO", SqlDbType.NVarChar).Value = ApplicaNo;
            cmd.Parameters.Add("@APPLICATIONDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(AppliDate);
            cmd.Parameters.Add("@APPLICATIONAME", SqlDbType.NVarChar).Value = AppliName;
            cmd.Parameters.Add("@GENDER", SqlDbType.NVarChar).Value = Gender;
            cmd.Parameters.Add("@DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(DOB);
            cmd.Parameters.Add("@FATHERNAME", SqlDbType.NVarChar).Value = Father;
            cmd.Parameters.Add("@MOTHERNAME", SqlDbType.NVarChar).Value = Monther;
            cmd.Parameters.Add("@GUARDIANNAME", SqlDbType.NVarChar).Value = Guard;
            cmd.Parameters.Add("@MARTIALSTATUS", SqlDbType.NVarChar).Value = Martial;
            cmd.Parameters.Add("@SPOUSENAME", SqlDbType.NVarChar).Value = Sopuse;
            cmd.Parameters.Add("@PERMANENTNOANDSTREET", SqlDbType.NVarChar).Value = PerStreet;
            cmd.Parameters.Add("@PERMANENTTOWN", SqlDbType.NVarChar).Value = PerTown;
            cmd.Parameters.Add("@PERMANENTCITY", SqlDbType.NVarChar).Value = PerCity;
            cmd.Parameters.Add("@PERMANENTSTATEID", SqlDbType.NVarChar).Value = PerState;
            cmd.Parameters.Add("@PERMANENTPINCODE", SqlDbType.NVarChar).Value = PerPin;
            cmd.Parameters.Add("@PRESENTNOANDSTREET", SqlDbType.NVarChar).Value = PreStreet;
            cmd.Parameters.Add("@PRESENTTOWN", SqlDbType.NVarChar).Value = PreTown;
            cmd.Parameters.Add("@PRESENTCITY", SqlDbType.NVarChar).Value = PreCity;
            cmd.Parameters.Add("@PRESENTSTATEID", SqlDbType.NVarChar).Value = PreState;
            cmd.Parameters.Add("@PRESENTPINCODE", SqlDbType.NVarChar).Value = PrePin;
            cmd.Parameters.Add("@EDUCATIONCAT", SqlDbType.NVarChar).Value = Educat;
            cmd.Parameters.Add("@QUALIFICATION", SqlDbType.NVarChar).Value = Quali;
            cmd.Parameters.Add("@COURSE", SqlDbType.NVarChar).Value = Course;
            cmd.Parameters.Add("@BLOODGROUP", SqlDbType.NVarChar).Value = Blood;
            cmd.Parameters.Add("@MOBILENO1", SqlDbType.NVarChar).Value = Mobile1;
            cmd.Parameters.Add("@MOBILENO2", SqlDbType.NVarChar).Value = Mobile2;
            cmd.Parameters.Add("@ADHARNO", SqlDbType.NVarChar).Value = Adhar;
            cmd.Parameters.Add("@PANNO", SqlDbType.NVarChar).Value = Pan;
            //cmd.Parameters.Add("@EMPPHOTO", SqlDbType.VarChar).Value = Course;
            cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = Email;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectApplicationDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectApplicationCountForImport()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationCountForImportSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeCountForImport(string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCountForImportSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();    
        }

        public DataTable SelectApplicationNoNamAdharCheck(string ApplicaNo, string ApplicaName, string Adharno)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationNoNamAdharCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONAME", SqlDbType.Int).Value = ApplicaNo;
            cmd.Parameters.Add("@APPLICATIONAME", SqlDbType.NVarChar).Value = ApplicaName;
            cmd.Parameters.Add("@ADHARNO", SqlDbType.NVarChar).Value = Adharno;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            //da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectApplicationNoCheck(string ApplicaName,string Adharno)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationNoCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONAME", SqlDbType.NVarChar).Value = ApplicaName;
            cmd.Parameters.Add("@ADHARNO", SqlDbType.NVarChar).Value = Adharno;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectSalaryMasterGradeCheck(string Grade, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryMasterGradeCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@GRADE", SqlDbType.NVarChar).Value = Grade;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectPFCheck(string PFName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PFCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PFEMPLOYEESEPF", SqlDbType.NVarChar).Value = PFName;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectESICheck(string ESIName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESICheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ESIEMPLOYEES", SqlDbType.NVarChar).Value = ESIName;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable SelectDepartmentMasterCheck(string DptName, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentMasterCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.NVarChar).Value = DptName;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectDesignationMasterCheck(string DesgName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DesignationMasterCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DESIGNATIONNAME", SqlDbType.NVarChar).Value = DesgName;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeApplicationID(string AplliNo)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeApplicationID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONNO", SqlDbType.NVarChar).Value = AplliNo;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectCityAndStateID(string City, string State)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CityAndStateID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CITYNAME", SqlDbType.NVarChar).Value = City;
            cmd.Parameters.Add("@STATENAME", SqlDbType.NVarChar).Value = State;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        // ---- Interview Schedule
        public DataTable SelectClientDetailID(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ClientDetailIDSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
            
        }

        public object SelectApplicationNoList()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationNo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectInterviewApplicationNo()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InterviewApplicationNoSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertInterviewDetails(string Date, string ApplicaID, string ClntID, string Division, string DesigID, string Status, string Feedback)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InterviewDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime( Date);
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = ApplicaID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.VarChar).Value = Division;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.VarChar).Value = DesigID;
            cmd.Parameters.Add("@STATUS", SqlDbType.VarChar).Value = Status;
            cmd.Parameters.Add("@FEEDBACK", SqlDbType.VarChar).Value = Feedback;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public DataTable SelectApplicationIDDetail(string ApplicaID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationIDDetail", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = ApplicaID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectApplicationNoMax()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationNoMaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectApplicationIDMax()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationIDMaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeCode(string EmpCode)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCodeSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = EmpCode;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void UpdateInterviewDetails(string IntID, string Date, string ApplicaID, string ClntID, string Division, string DesigID, string Status, string Feedback)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InterviewDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@INTERVIEWID", SqlDbType.VarChar).Value = IntID;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value =Convert.ToDateTime(Date);
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = ApplicaID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.VarChar).Value = Division;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.VarChar).Value = DesigID;
            cmd.Parameters.Add("@STATUS", SqlDbType.VarChar).Value = Status;
            cmd.Parameters.Add("@FEEDBACK", SqlDbType.VarChar).Value = Feedback;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectInterviewDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InterviewDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectInterviewDetailView(string FrmDate, string ToDate, string ApplicaID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InterviewDetailViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = ApplicaID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public object SelectResumeIdDetailView()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ResumeIdDetailViewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // EmployeeCompanyDetail 01-08-2020
        public void InsertEmployeeCompanyDetail(string ApplicaID, string EmpID, string DOB, string Jbtype, string Jbcat, string ClntID, string DptID, string DsgID,
            string DevID, string Wage, string BasicDA, string HRA, string Convey, string Washing, string Other, string TotHur, string OtAmt, string Contrac, string PFID,
            string UANNO, string PFNO, string ESIID, string ESINO, string TA, string Aadhar,
            string SlryType, string SlryIss, string IFSC, string Bank, string Branch,
            string Acc, string PANNO, string EmgName, string EmgRelaShip, string EmgMob, string EmgHome, string EmpIDMark, string PFName, string PFDate, string PFRelaShip,
            string PFStreet, string PFTown, string PFCity, string PFState, string PFPin, string PFMob, string PFHome, string ESIName, string ESIDate, string ESIRelaShip,
            string ESIStreet, string ESITown, string ESICity, string ESIState, string ESIPin, string ESIMob, string ESIHome,string RefName,string RefDesg, string RefMob, string RefName2, string RefDesg2, string RefMob2, string EmpStatus)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = ApplicaID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = EmpID;
            cmd.Parameters.Add("@DATEOFJOIN", SqlDbType.DateTime).Value = Convert.ToDateTime(DOB);
            cmd.Parameters.Add("@JOBTYPE", SqlDbType.VarChar).Value = Jbtype;
            cmd.Parameters.Add("@JOBCATEGORY", SqlDbType.VarChar).Value = Jbcat;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.VarChar).Value = DptID;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.VarChar).Value = DsgID;
            cmd.Parameters.Add("@SALARYGRADE", SqlDbType.VarChar).Value = DevID;
            cmd.Parameters.Add("@WAGEPERDAY", SqlDbType.VarChar).Value = Wage;
            cmd.Parameters.Add("@BASICDA", SqlDbType.VarChar).Value = BasicDA;
            cmd.Parameters.Add("@HRA", SqlDbType.VarChar).Value = HRA;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.VarChar).Value = Convey;
            cmd.Parameters.Add("@WASHING", SqlDbType.VarChar).Value = Washing;
            cmd.Parameters.Add("@OTHER", SqlDbType.VarChar).Value = Other;
            cmd.Parameters.Add("@TOTALPERHOUR", SqlDbType.VarChar).Value = TotHur;
            cmd.Parameters.Add("@OTAMOUNT", SqlDbType.VarChar).Value = OtAmt;
            cmd.Parameters.Add("@CONTRACTORS", SqlDbType.VarChar).Value = Contrac;
            cmd.Parameters.Add("@PFID", SqlDbType.VarChar).Value = PFID;
            cmd.Parameters.Add("@UANNO", SqlDbType.VarChar).Value = UANNO;
            cmd.Parameters.Add("@PFNO", SqlDbType.VarChar).Value = PFNO;
            cmd.Parameters.Add("@ESIID", SqlDbType.VarChar).Value = ESIID;
            cmd.Parameters.Add("@ESINO", SqlDbType.VarChar).Value = ESINO;
            cmd.Parameters.Add("@TA", SqlDbType.VarChar).Value = TA;
            cmd.Parameters.Add("@EMPAADHAR", SqlDbType.VarChar).Value = Aadhar;
            cmd.Parameters.Add("@SALARYTYPE", SqlDbType.VarChar).Value = SlryType;
            cmd.Parameters.Add("@SALARYISSUETYPE", SqlDbType.VarChar).Value = SlryIss;
            cmd.Parameters.Add("@IFSCCODE", SqlDbType.VarChar).Value = IFSC;
            cmd.Parameters.Add("@BANKNAME", SqlDbType.VarChar).Value = Bank;
            cmd.Parameters.Add("@BRANCH", SqlDbType.VarChar).Value = Branch;
            cmd.Parameters.Add("@ACCOUNTNO", SqlDbType.VarChar).Value = Acc;

            cmd.Parameters.Add("@PANNO", SqlDbType.VarChar).Value = PANNO;

            cmd.Parameters.Add("@EMGNAME", SqlDbType.VarChar).Value = EmgName;
            cmd.Parameters.Add("@EMGRELATIONSHIP", SqlDbType.VarChar).Value = EmgRelaShip;
            cmd.Parameters.Add("@EMGMOBILENUMBER", SqlDbType.VarChar).Value = EmgMob;
            cmd.Parameters.Add("@EMGNOMINEEHOMENUMBER", SqlDbType.VarChar).Value = EmgHome;
            cmd.Parameters.Add("@EMPIDMARK", SqlDbType.VarChar).Value = EmpIDMark;
            cmd.Parameters.Add("@PFNOMINEENAME", SqlDbType.VarChar).Value = PFName;
            cmd.Parameters.Add("@PFNOMINEEDOB", SqlDbType.DateTime).Value = Convert.ToDateTime(PFDate);
            cmd.Parameters.Add("@PFNOMINEERELATIONSHIP", SqlDbType.VarChar).Value = PFRelaShip;
            cmd.Parameters.Add("@PFNOMINEENOANDSTREET", SqlDbType.VarChar).Value = PFStreet;
            cmd.Parameters.Add("@PFNOMINEETOWN", SqlDbType.VarChar).Value = PFTown;
            cmd.Parameters.Add("@PFNOMINEECITY", SqlDbType.VarChar).Value = PFCity;
            cmd.Parameters.Add("@PFNOMINEESTATE", SqlDbType.VarChar).Value = PFState;
            cmd.Parameters.Add("@PFNOMINEEPINCODE", SqlDbType.VarChar).Value = PFPin;
            cmd.Parameters.Add("@PFNOMINEEMOBILENUMBER", SqlDbType.VarChar).Value = PFMob;
            cmd.Parameters.Add("@PFNOMINEEHOMENUMBER", SqlDbType.VarChar).Value = PFHome;
            cmd.Parameters.Add("@ESINOMINEENAME", SqlDbType.VarChar).Value = ESIName;
            cmd.Parameters.Add("@ESINOMINEEDOB", SqlDbType.DateTime).Value = Convert.ToDateTime(ESIDate);
            cmd.Parameters.Add("@ESINOMINEERELATIONSHIP", SqlDbType.VarChar).Value = ESIRelaShip;
            cmd.Parameters.Add("@ESINOMINEENOANDSTREET", SqlDbType.VarChar).Value = ESIStreet;
            cmd.Parameters.Add("@ESINOMINEETOWN", SqlDbType.VarChar).Value = ESITown;
            cmd.Parameters.Add("@ESINOMINEECITY", SqlDbType.VarChar).Value = ESICity;
            cmd.Parameters.Add("@ESINOMINEESTATE", SqlDbType.VarChar).Value = ESIState;
            cmd.Parameters.Add("@ESINOMINEEPINCODE", SqlDbType.VarChar).Value = ESIPin;
            cmd.Parameters.Add("@ESINOMINEEMOBILENUMBER", SqlDbType.VarChar).Value = ESIMob;
            cmd.Parameters.Add("@ESINOMINEEHOMENUMBER", SqlDbType.VarChar).Value = ESIHome;
            cmd.Parameters.Add("@REFNAME1", SqlDbType.VarChar).Value = RefName;
            cmd.Parameters.Add("@REFDESIGNATION1", SqlDbType.VarChar).Value = RefDesg;
            cmd.Parameters.Add("@REFCONTACTNUMBER1", SqlDbType.VarChar).Value = RefMob;
            cmd.Parameters.Add("@REFNAME2", SqlDbType.VarChar).Value = RefName2;
            cmd.Parameters.Add("@REFDESIGNATION2", SqlDbType.VarChar).Value = RefDesg2;
            cmd.Parameters.Add("@REFCONTACTNUMBER2", SqlDbType.VarChar).Value = RefMob2;
            cmd.Parameters.Add("@EMPLOYEESTATUS", SqlDbType.VarChar).Value = EmpStatus;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectApplicationNoDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationNoDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void DeleteApplication(string AppID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicationDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = AppID;           
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateEmployeeApplicationFlagID(string AppID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeApplicationFlagID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@APPLICATIONID", SqlDbType.VarChar).Value = AppID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public DataTable SelectSalaryMasterGrade(string Grade)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("SalaryMasterGradeSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@SALARYID", SqlDbType.VarChar).Value = Grade;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();

        }

        public DataTable SelectEmployeeCompanyDetailCode()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailCodeSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();

        }

        // Employee Personal Detail 07-08-2020

        public object SelectEmployeeIDDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ApplicDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        //-------- Employee Releave Detail

        public void InsertEmployeeReleaving(string EntDate, string ReleavingDate, string Reason, string EmpId)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeReleavingInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ENTDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(EntDate);
            cmd.Parameters.Add("@RELEAVINGDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ReleavingDate);
            cmd.Parameters.Add("@REASON", SqlDbType.VarChar).Value = Reason;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateEmployeeReleaving(string TypeId, string EntDate, string ReleavingDate, string Reason, string EmpId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeReleavingUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPRELEAVID", SqlDbType.VarChar).Value = TypeId;
            cmd.Parameters.Add("@ENTDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(EntDate);
            cmd.Parameters.Add("@RELEAVINGDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ReleavingDate);
            cmd.Parameters.Add("@REASON", SqlDbType.VarChar).Value = Reason;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpId;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void UpdateEmployeeReleavingMaster(string Status, string EmpId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeReleavingUpdateMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            cmd.Parameters.Add("@EMPLOYEESTATUS", SqlDbType.VarChar).Value = Status;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }


        public object SelectEmployeeID()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectEmployeeReleaving()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeReleavingSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable SelectEmployeeCompanyDetailReport()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailReportSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public object SelectCompanyDetailEdit(string FromDate,string ToDate, string ClntID, string DptName, string EmpCode)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailEdit", con);
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.VarChar).Value = "%" + DptName + "%";

            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = "%" + EmpCode + "%";


            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectCompanyDetailEditClient(string FromDate, string ToDate, string ClntName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailEditClient", con);
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value ="%" + ClntName + "%";            
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable SelectAttendanceCountForMonth(string FromDate, string ToDate, string ClntName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AttendanceCountForMonth", con);
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntName;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectCompanyDetailEditAll(string DptName, string EmpCode, string ClntName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailEditAll", con);            
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.NVarChar).Value = "%" + DptName + "%";
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = "%" + EmpCode + "%";
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = "%" + ClntName + "%";
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable EmployeeCompanyDetailEditOnUnit(string DptName, string EmpCode, string ClnID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailEditOnUnit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.NVarChar).Value = "%" + DptName + "%";
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = "%" + EmpCode + "%";
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClnID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable SelectCompanyDetailEditCode(string EmpCode)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailCode", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = EmpCode;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }
    

        public void DeleteEmployeeCompanyDetail(string EmpID, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        //-------- Attendance Entry

        public object SelectEmployeeAttendaceDetail(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AttendanceForSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertDailyAttendane(string Date, string ClntID, string Division, string EmpID, string EmpCode, string DeptID, string WorkHour,
                                        string OtHours, string OtAmount, string BasicDA, string HRA, string Convey, string Wasing, string Other,
                                        string PFID, string ESIID, string RoomRent, string Insur, string OT1, string OT2, string OT3, string CompanyID, 
                                        string Status, string OtAmount2, string OtAmount3)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DailyAttendaneInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISIONID", SqlDbType.VarChar).Value = Division;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.VarChar).Value = DeptID;
            cmd.Parameters.Add("@SHIFTHOUR", SqlDbType.VarChar).Value = WorkHour;
            cmd.Parameters.Add("@OTHOURS", SqlDbType.VarChar).Value = OtHours;
            cmd.Parameters.Add("@OTAMOUNT", SqlDbType.VarChar).Value = OtAmount;
            cmd.Parameters.Add("@OTAMOUNT2", SqlDbType.VarChar).Value = OtAmount2;
            cmd.Parameters.Add("@OTAMOUNT3", SqlDbType.VarChar).Value = OtAmount3;

            cmd.Parameters.Add("@BASICDA", SqlDbType.VarChar).Value = BasicDA;
            cmd.Parameters.Add("@HRA", SqlDbType.VarChar).Value = HRA;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.VarChar).Value = Convey;
            cmd.Parameters.Add("@WASHING", SqlDbType.VarChar).Value = Wasing;
            cmd.Parameters.Add("@OTHER", SqlDbType.VarChar).Value = Other;
            cmd.Parameters.Add("@PFID", SqlDbType.VarChar).Value = PFID;
            cmd.Parameters.Add("@ESIID", SqlDbType.VarChar).Value = ESIID;
            cmd.Parameters.Add("@ROOMRENT", SqlDbType.VarChar).Value = RoomRent;
            cmd.Parameters.Add("@INSURANCE", SqlDbType.VarChar).Value = Insur;
            cmd.Parameters.Add("@OT1", SqlDbType.VarChar).Value = OT1;
            cmd.Parameters.Add("@OT2", SqlDbType.VarChar).Value = OT2;
            cmd.Parameters.Add("@OT3", SqlDbType.VarChar).Value = OT3;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.VarChar).Value = CompanyID;
            cmd.Parameters.Add("@STATUS", SqlDbType.VarChar).Value = Status;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

       

        public void DeleteAttendanceEntry(string Date, string EmpID, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AttendanceEntryDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public object SelectEmployeecheckMonthlyAttDetail(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeecheckMonthlyAttDetailSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void DeleteDailyAttendane(string FromDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DailyAttendaceDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromeDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public void DeleteMDAndETBreakUp(string FromDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MDAndETBreakUpDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public DataTable SelectDailyAttendaceCheck(string FromDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DailyAttendaceCheckSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromeDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeCompanyDetailCheckExl(string EmpCode, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailCheckExlSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeCompanyDetailCheck(string EmpCode, string ClntID, string DOJ)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCompanyDetailCheckSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DATEOFJOIN", SqlDbType.NVarChar).Value = DOJ;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectMonthlyAttendanceExport(string ClntID,string MonthYear)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyAttendanceExportSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DateMonth", SqlDbType.DateTime).Value = DateTime.Parse(MonthYear);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public void DeletePerDailyAttendane(string Date, string EmpID, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DailyAttendaceDeletePer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.VarChar).Value = EmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }

            con.Close();
        }

        public DataTable SelectDailyAttendaneDetail(string FromDt, string ToDt,string ClntID, string DptName, string Empcode, string Jobtype,string Status)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DailyAttendaneSelect", con);
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDt);
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.VarChar).Value = "%" + DptName + "%";
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = "%" + Empcode + "%";
            cmd.Parameters.Add("@JOBCATEGORY", SqlDbType.NVarChar).Value = "%" + Jobtype + "%";

            cmd.Parameters.Add("@STATUS", SqlDbType.NVarChar).Value = "%" + Status + "%";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
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
            con.Close();
            con.Open();
            cmd = new SqlCommand("Attendance12and25Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = DptID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClnID;

            cmd.Parameters.Add("@DAY1", SqlDbType.NVarChar).Value = Day1;
            cmd.Parameters.Add("@DAY2", SqlDbType.NVarChar).Value = Day2;
            cmd.Parameters.Add("@DAY3", SqlDbType.NVarChar).Value = Day3;
            cmd.Parameters.Add("@DAY4", SqlDbType.NVarChar).Value = Day4;
            cmd.Parameters.Add("@DAY5", SqlDbType.NVarChar).Value = Day5;
            cmd.Parameters.Add("@DAY6", SqlDbType.NVarChar).Value = Day6;
            cmd.Parameters.Add("@DAY7", SqlDbType.NVarChar).Value = Day7;
            cmd.Parameters.Add("@DAY8", SqlDbType.NVarChar).Value = Day8;
            cmd.Parameters.Add("@DAY9", SqlDbType.NVarChar).Value = Day9;
            cmd.Parameters.Add("@DAY10", SqlDbType.NVarChar).Value = Day10;
            cmd.Parameters.Add("@DAY11", SqlDbType.NVarChar).Value = Day11;
            cmd.Parameters.Add("@DAY12", SqlDbType.NVarChar).Value = Day12;
            cmd.Parameters.Add("@DAY13", SqlDbType.NVarChar).Value = Day13;
            cmd.Parameters.Add("@DAY14", SqlDbType.NVarChar).Value = Day14;
            cmd.Parameters.Add("@DAY15", SqlDbType.NVarChar).Value = Day15;
            cmd.Parameters.Add("@DAY16", SqlDbType.NVarChar).Value = Day16;
            cmd.Parameters.Add("@DAY17", SqlDbType.NVarChar).Value = Day17;
            cmd.Parameters.Add("@DAY18", SqlDbType.NVarChar).Value = Day18;
            cmd.Parameters.Add("@DAY19", SqlDbType.NVarChar).Value = Day19;
            cmd.Parameters.Add("@DAY20", SqlDbType.NVarChar).Value = Day20;
            cmd.Parameters.Add("@DAY21", SqlDbType.NVarChar).Value = Day21;
            cmd.Parameters.Add("@DAY22", SqlDbType.NVarChar).Value = Day22;
            cmd.Parameters.Add("@DAY23", SqlDbType.NVarChar).Value = Day23;
            cmd.Parameters.Add("@DAY24", SqlDbType.NVarChar).Value = Day24;
            cmd.Parameters.Add("@DAY25", SqlDbType.NVarChar).Value = Day25;
            cmd.Parameters.Add("@DAY26", SqlDbType.NVarChar).Value = Day26;
            cmd.Parameters.Add("@DAY27", SqlDbType.NVarChar).Value = Day27;
            cmd.Parameters.Add("@DAY28", SqlDbType.NVarChar).Value = Day28;
            cmd.Parameters.Add("@DAY29", SqlDbType.NVarChar).Value = Day29;
            cmd.Parameters.Add("@DAY30", SqlDbType.NVarChar).Value = Day30;
            cmd.Parameters.Add("@DAY31", SqlDbType.NVarChar).Value = Day31;

            cmd.Parameters.Add("@OT1", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot1).ToString("0.00");
            cmd.Parameters.Add("@OT2", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot2).ToString("0.00");
            cmd.Parameters.Add("@OT3", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot3).ToString("0.00");
            cmd.Parameters.Add("@OT4", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot4).ToString("0.00");
            cmd.Parameters.Add("@OT5", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot5).ToString("0.00");
            cmd.Parameters.Add("@OT6", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot6).ToString("0.00");
            cmd.Parameters.Add("@OT7", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot7).ToString("0.00");
            cmd.Parameters.Add("@OT8", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot8).ToString("0.00");
            cmd.Parameters.Add("@OT9", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot9).ToString("0.00");
            cmd.Parameters.Add("@OT10", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot10).ToString("0.00");
            cmd.Parameters.Add("@OT11", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot11).ToString("0.00");
            cmd.Parameters.Add("@OT12", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot12).ToString("0.00");
            cmd.Parameters.Add("@OT13", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot13).ToString("0.00");
            cmd.Parameters.Add("@OT14", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot14).ToString("0.00");
            cmd.Parameters.Add("@OT15", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot15).ToString("0.00");
            cmd.Parameters.Add("@OT16", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot16).ToString("0.00");
            cmd.Parameters.Add("@OT17", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot17).ToString("0.00");
            cmd.Parameters.Add("@OT18", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot18).ToString("0.00");
            cmd.Parameters.Add("@OT19", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot19).ToString("0.00");
            cmd.Parameters.Add("@OT20", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot20).ToString("0.00");
            cmd.Parameters.Add("@OT21", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot21).ToString("0.00");
            cmd.Parameters.Add("@OT22", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot22).ToString("0.00");
            cmd.Parameters.Add("@OT23", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot23).ToString("0.00");
            cmd.Parameters.Add("@OT24", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot24).ToString("0.00");
            cmd.Parameters.Add("@OT25", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot25).ToString("0.00");
            cmd.Parameters.Add("@OT26", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot26).ToString("0.00");
            cmd.Parameters.Add("@OT27", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot27).ToString("0.00");
            cmd.Parameters.Add("@OT28", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot28).ToString("0.00");
            cmd.Parameters.Add("@OT29", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot29).ToString("0.00");
            cmd.Parameters.Add("@OT30", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot30).ToString("0.00");
            cmd.Parameters.Add("@OT31", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot31).ToString("0.00");

            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(ToDt);
            cmd.Parameters.Add("@Flag", SqlDbType.NVarChar).Value = Flag;

            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = TotPre;
            cmd.Parameters.Add("@TOTALOT", SqlDbType.Decimal).Value = TotOT;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        //-----

        public DataTable SelectDailyAttendaneEmployeeCode(string EmpCode)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DailyAttendaneEmployeeCode", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = EmpCode;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //------- Allowance Description 21-05-2021

        public void InsertAllowanceDescription(string ClntID, string DesCrip, string Code, string Types)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDescriptionInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@DESCRIPTION", SqlDbType.NVarChar).Value = DesCrip;
            cmd.Parameters.Add("@ALLDESCODE", SqlDbType.NVarChar).Value = Code;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateAllowanceDescription(string AllDesID, string ClntID, string DesCrip, string Code, string Types)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDescriptionUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ALLDESID", SqlDbType.Int).Value = AllDesID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@DESCRIPTION", SqlDbType.NVarChar).Value = DesCrip;
            cmd.Parameters.Add("@ALLDESCODE", SqlDbType.NVarChar).Value = Code;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectAllowanceDescription()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDescriptionSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        //------- Allowance Detail 31-08-2020

        public void InsertAllowanceDetail(string Date, string EmpID, string EmpCode, string ClntID, string Divi, 
            string DptID, string CmpID, string A1, string A2, string A3, string A4,
            string A5, string A6, string A7, string A8, string A9, string AD1, string AD2, string AD3, string AD4, string AD5,
            string AD6, string AD7, string AD8, string AD9)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CURRENTDATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.NVarChar).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = DptID;
            cmd.Parameters.Add("@A1", SqlDbType.Decimal).Value = A1;
            cmd.Parameters.Add("@A2", SqlDbType.Decimal).Value = A2;
            cmd.Parameters.Add("@A3", SqlDbType.Decimal).Value = A3;
            cmd.Parameters.Add("@A4", SqlDbType.Decimal).Value = A4;
            cmd.Parameters.Add("@A5", SqlDbType.Decimal).Value = A5;
            cmd.Parameters.Add("@A6", SqlDbType.Decimal).Value = A6;
            cmd.Parameters.Add("@A7", SqlDbType.Decimal).Value = A7;
            cmd.Parameters.Add("@A8", SqlDbType.Decimal).Value = A8;
            cmd.Parameters.Add("@A9", SqlDbType.Decimal).Value = A9;

            cmd.Parameters.Add("@AD1", SqlDbType.NVarChar).Value = AD1;
            cmd.Parameters.Add("@AD2", SqlDbType.NVarChar).Value = AD2;
            cmd.Parameters.Add("@AD3", SqlDbType.NVarChar).Value = AD3;
            cmd.Parameters.Add("@AD4", SqlDbType.NVarChar).Value = AD4;
            cmd.Parameters.Add("@AD5", SqlDbType.NVarChar).Value = AD5;
            cmd.Parameters.Add("@AD6", SqlDbType.NVarChar).Value = AD6;
            cmd.Parameters.Add("@AD7", SqlDbType.NVarChar).Value = AD7;
            cmd.Parameters.Add("@AD8", SqlDbType.NVarChar).Value = AD8;
            cmd.Parameters.Add("@AD9", SqlDbType.NVarChar).Value = AD9;

            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteAllowanceDetail(string Date, string ClntID, string Divi)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDelete", con);
            cmd.Parameters.Add("@CURRENTDATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            cmd.CommandType = CommandType.StoredProcedure;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();            
        }

        public object SelectAllowanceDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceSelect", con);            
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }



        public void InsertDeductionDescription(string Description, string AllDesCode, string ClntID, string Types)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDescriptionInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DESCRIPTION", SqlDbType.NVarChar).Value = Description;
            cmd.Parameters.Add("@ALLDESCODE", SqlDbType.NVarChar).Value = AllDesCode;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateDeductionDescription(string Description, string AllDesCode, string ClntID, string Types, string DesID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDescriptionUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DESCRIPTION", SqlDbType.NVarChar).Value = Description;
            cmd.Parameters.Add("@ALLDESCODE", SqlDbType.NVarChar).Value = AllDesCode;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            cmd.Parameters.Add("@DESID", SqlDbType.NVarChar).Value = DesID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectDeductionDescriptionID(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDescriptionIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectAllowanceDescriptionID(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDescriptionIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable AllowanceDescriptionCodeSelect(string ClntID, string Code)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceDescriptionCodeSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@ALLDESCODE", SqlDbType.VarChar).Value = Code;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectDescription()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDescriptionSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectDeductionsForColumn(string FrmDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionsForColumnSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDate);
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectAllowanceForColumn(string FrmDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceForColumnSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDate);
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable SelectAllowanceFor(string ClntID, string DptName, string EmpCode)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceForSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTNAME", SqlDbType.VarChar).Value = "%" + DptName + "%";
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.VarChar).Value = "%" + EmpCode + "%";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectSetAllowanceDetail(string Date, string ClntID, string Divi)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceSetSelect", con);
            cmd.Parameters.Add("@CURRENTDATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public object SelectAllowanceDetailFilter(string FromDate, string ToDate, string ClntID, string Divi)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AllowanceSelectFilter", con);
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        // ------ Deduction Detail 04/09/2020

        public object SelectEmployeeDeductionDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public object SelectEmployeeDeductionDetail(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionEmployeeSelect", con);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.VarChar).Value = ClntID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectDeductionEmployeeDetail(string DeductID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionEmployeeDetailSelect", con);
            cmd.Parameters.Add("@DEDUCTIONID", SqlDbType.VarChar).Value = DeductID;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertDeductionDetail(string Date, string ClntID, string CmpID, string Divi, string TotD1, 
            string TotD2, string TotD3, string TotD4,
                                            string TotD5, string TotD6, string TotD7, string TotD8, string Total)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionHdrInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CURRENTDATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@TOTALD1", SqlDbType.NVarChar).Value = TotD1;
            cmd.Parameters.Add("@TOTALD2", SqlDbType.NVarChar).Value = TotD2;
            cmd.Parameters.Add("@TOTALD3", SqlDbType.NVarChar).Value = TotD3;
            cmd.Parameters.Add("@TOTALD4", SqlDbType.NVarChar).Value = TotD4;
            cmd.Parameters.Add("@TOTALD5", SqlDbType.NVarChar).Value = TotD5;
            cmd.Parameters.Add("@TOTALD6", SqlDbType.NVarChar).Value = TotD6;
            cmd.Parameters.Add("@TOTALD7", SqlDbType.NVarChar).Value = TotD7;
            cmd.Parameters.Add("@TOTALD8", SqlDbType.NVarChar).Value = TotD8;
            cmd.Parameters.Add("@TOTAL", SqlDbType.NVarChar).Value = Total;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateDeductionDetail(string DeductID, string Date, string ClntID, string CmpID, string Divi, string TotD1,
            string TotD2, string TotD3, string TotD4,
                                            string TotD5, string TotD6, string TotD7, string TotD8, string Total)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionHdrUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEDUCTIONID", SqlDbType.NVarChar).Value = DeductID;
            cmd.Parameters.Add("@CURRENTDATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.NVarChar).Value = CmpID;
            cmd.Parameters.Add("@TOTALD1", SqlDbType.NVarChar).Value = TotD1;
            cmd.Parameters.Add("@TOTALD2", SqlDbType.NVarChar).Value = TotD2;
            cmd.Parameters.Add("@TOTALD3", SqlDbType.NVarChar).Value = TotD3;
            cmd.Parameters.Add("@TOTALD4", SqlDbType.NVarChar).Value = TotD4;
            cmd.Parameters.Add("@TOTALD5", SqlDbType.NVarChar).Value = TotD5;
            cmd.Parameters.Add("@TOTALD6", SqlDbType.NVarChar).Value = TotD6;
            cmd.Parameters.Add("@TOTALD7", SqlDbType.NVarChar).Value = TotD7;
            cmd.Parameters.Add("@TOTALD8", SqlDbType.NVarChar).Value = TotD8;
            cmd.Parameters.Add("@TOTAL", SqlDbType.NVarChar).Value = Total;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectDeductionsID()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionsIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void DeleteDeductionDtlDetail(string DeductID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEDUCTIONID", SqlDbType.NVarChar).Value = DeductID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }
        public void InsertDeductionDtlDetail(string DeductID, string EmpID, string EmpCode, string CmpID, string D1, string D2, string D3, string D4,
                                           string D5, string D6, string D7, string D8, string Total, string DD1, string DD2, string DD3, string DD4,
                                           string DD5, string DD6, string DD7, string DD8)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DeductionDtlInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DEDUCTIONID", SqlDbType.Int).Value = DeductID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.Int).Value = CmpID;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.Int).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@D1", SqlDbType.Decimal).Value = D1;
            cmd.Parameters.Add("@D2", SqlDbType.Decimal).Value = D2;
            cmd.Parameters.Add("@D3", SqlDbType.Decimal).Value = D3;
            cmd.Parameters.Add("@D4", SqlDbType.Decimal).Value = D4;
            cmd.Parameters.Add("@D5", SqlDbType.Decimal).Value = D5;
            cmd.Parameters.Add("@D6", SqlDbType.Decimal).Value = D6;
            cmd.Parameters.Add("@D7", SqlDbType.Decimal).Value = D7;
            cmd.Parameters.Add("@D8", SqlDbType.Decimal).Value = D8;
            cmd.Parameters.Add("@Total", SqlDbType.Decimal).Value = Total;
            cmd.Parameters.Add("@DD1", SqlDbType.NVarChar).Value = DD1;
            cmd.Parameters.Add("@DD2", SqlDbType.NVarChar).Value = DD2;
            cmd.Parameters.Add("@DD3", SqlDbType.NVarChar).Value = DD3;
            cmd.Parameters.Add("@DD4", SqlDbType.NVarChar).Value = DD4;
            cmd.Parameters.Add("@DD5", SqlDbType.NVarChar).Value = DD5;
            cmd.Parameters.Add("@DD6", SqlDbType.NVarChar).Value = DD6;
            cmd.Parameters.Add("@DD7", SqlDbType.NVarChar).Value = DD7;
            cmd.Parameters.Add("@DD8", SqlDbType.NVarChar).Value = DD8;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable MonthlyPayrollIDSelect()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable MonthlyPayrollHdrForReportJIDSelect()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollHdrForReportJIDSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectPayrollMonthlyGenerate(string FromDate, string ToDate, string ClntID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("PayrollMonthlyGenerate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectPayrollMonthlyGenerateForReportJ(string FromDate, string ToDate, string ClntID)
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("PayrollMonthlyGenerateForReportJ", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@Todate", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertMonthlyPayrollHdr(string FromDate, string ToDate, string TotalDays, string ClntID, string NoEmp, string TotGross, string TotNet, string PFLimit, string TotWrkDays)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollHdrInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@TOTALDAYS", SqlDbType.Decimal).Value = TotalDays;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@NOOFEMPLOYEE", SqlDbType.Decimal).Value = NoEmp;
            cmd.Parameters.Add("@TOTALGROSS", SqlDbType.Decimal).Value = TotGross;
            cmd.Parameters.Add("@TOTALNETWAGE", SqlDbType.Decimal).Value = TotNet;
            cmd.Parameters.Add("@PFLIMIT", SqlDbType.NVarChar).Value = PFLimit;
            cmd.Parameters.Add("@WORKINGDAYS", SqlDbType.Decimal).Value = TotWrkDays;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void InsertMonthlyPayrollHdrForReportJ(string FromDate, string ToDate, string TotalDays, string ClntID, string NoEmp, string TotGross, string TotNet, string PFLimit, string TotWrkDays)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollHdrForReportJInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@TOTALDAYS", SqlDbType.Decimal).Value = TotalDays;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@NOOFEMPLOYEE", SqlDbType.Decimal).Value = NoEmp;
            cmd.Parameters.Add("@TOTALGROSS", SqlDbType.Decimal).Value = TotGross;
            cmd.Parameters.Add("@TOTALNETWAGE", SqlDbType.Decimal).Value = TotNet;
            cmd.Parameters.Add("@PFLIMIT", SqlDbType.NVarChar).Value = PFLimit;
            cmd.Parameters.Add("@WORKINGDAYS", SqlDbType.Decimal).Value = TotWrkDays;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void InsertMonthlyPayrollDtl(string PayrollID,string EmpID, string EmpCode, string DptID, string DesdID, string WageType,
            string FixGrade, string WageDay, string EpfWageDay, string WrkDays, string ET1, string ET2, string ET3, 
            string Basic, string Hra, string Convey, string Washing, string A1, string A2, string A3, string A4, string A5, string A6, 
            string A7, string A8, string A9, string TotalWg, string OTAmount1, string OTAmount2, string OTAmount3, string TotExtra, string TotGross, string EpfWage, string Epf, string EsiWage,
            string Esi, string Advance, string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8, 
            string TotDeduct, string Netwage)
        {    
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollDtlInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PAYROOLID", SqlDbType.NVarChar).Value = PayrollID;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.NVarChar).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = DptID;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.Decimal).Value = DesdID;
            cmd.Parameters.Add("@WAGETYPE", SqlDbType.NVarChar).Value = WageType;
            cmd.Parameters.Add("@FIXEDGRADE", SqlDbType.NVarChar).Value = FixGrade;
            cmd.Parameters.Add("@WAGEDAY", SqlDbType.NVarChar).Value = WageDay;
            cmd.Parameters.Add("@EPFWAGEDAY", SqlDbType.NVarChar).Value = EpfWageDay;
            cmd.Parameters.Add("@WORKDAYS", SqlDbType.NVarChar).Value = WrkDays;

            cmd.Parameters.Add("@ET1", SqlDbType.NVarChar).Value = ET1;
            cmd.Parameters.Add("@ET2", SqlDbType.NVarChar).Value = ET2;
            cmd.Parameters.Add("@ET3", SqlDbType.NVarChar).Value = ET3;
            

            cmd.Parameters.Add("@BASICDA", SqlDbType.NVarChar).Value = Basic;
            cmd.Parameters.Add("@HRA", SqlDbType.NVarChar).Value = Hra;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.Decimal).Value = Convey;
            cmd.Parameters.Add("@WASHING", SqlDbType.NVarChar).Value = Washing;

            cmd.Parameters.Add("@A1", SqlDbType.NVarChar).Value = A1;
            cmd.Parameters.Add("@A2", SqlDbType.NVarChar).Value = A2;
            cmd.Parameters.Add("@A3", SqlDbType.NVarChar).Value = A3;
            cmd.Parameters.Add("@A4", SqlDbType.NVarChar).Value = A4;
            cmd.Parameters.Add("@A5", SqlDbType.NVarChar).Value = A5;
            cmd.Parameters.Add("@A6", SqlDbType.NVarChar).Value = A6;
            cmd.Parameters.Add("@A7", SqlDbType.NVarChar).Value = A7;
            cmd.Parameters.Add("@A8", SqlDbType.NVarChar).Value = A8;
            cmd.Parameters.Add("@A9", SqlDbType.NVarChar).Value = A9;

            cmd.Parameters.Add("@TOTALWAGE", SqlDbType.NVarChar).Value = TotalWg;

            cmd.Parameters.Add("@TOTALOTAMOUNT1", SqlDbType.NVarChar).Value = OTAmount1;
            cmd.Parameters.Add("@TOTALOTAMOUNT2", SqlDbType.NVarChar).Value = OTAmount2;
            cmd.Parameters.Add("@TOTALOTAMOUNT3", SqlDbType.NVarChar).Value = OTAmount3;

            cmd.Parameters.Add("@TOTALEXTRA", SqlDbType.NVarChar).Value = TotExtra;
            cmd.Parameters.Add("@TOTALGROSS", SqlDbType.NVarChar).Value = TotGross;
            cmd.Parameters.Add("@EPFWAGE", SqlDbType.Decimal).Value = EpfWage;
            cmd.Parameters.Add("@EPF", SqlDbType.NVarChar).Value = Epf;
            cmd.Parameters.Add("@ESIWAGE", SqlDbType.NVarChar).Value = EsiWage;
            cmd.Parameters.Add("@ESI", SqlDbType.NVarChar).Value = Esi;
            cmd.Parameters.Add("@ADVANCE", SqlDbType.NVarChar).Value = Advance;

            cmd.Parameters.Add("@D1", SqlDbType.NVarChar).Value = D1;
            cmd.Parameters.Add("@D2", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D3", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D4", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D5", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D6", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D7", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D8", SqlDbType.NVarChar).Value = D2;

            cmd.Parameters.Add("@TOTALDEDUCTION", SqlDbType.NVarChar).Value = TotDeduct;
            cmd.Parameters.Add("@NETWAGE", SqlDbType.NVarChar).Value = Netwage;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }


        public void InsertMonthlyPayrollDtlForReportJ(string PayrollID, string EmpID, string EmpCode, string DptID, string DesdID, string WageType,
            string FixGrade, string WageDay, string EpfWageDay, string WrkDays, string ET1, string ET2, string ET3,
            string Basic, string Hra, string Convey, string Washing, string A1, string A2, string A3, string A4, string A5, string A6,
            string A7, string A8, string A9, string TotalWg, string OTAmount1, string OTAmount2, string OTAmount3, string TotExtra, string TotGross, string EpfWage, string Epf, string EsiWage,
            string Esi, string Advance, string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8,
            string TotDeduct, string Netwage)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollDtlForReportJInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PAYROOLID", SqlDbType.NVarChar).Value = PayrollID;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.NVarChar).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = DptID;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.Decimal).Value = DesdID;
            cmd.Parameters.Add("@WAGETYPE", SqlDbType.NVarChar).Value = WageType;
            cmd.Parameters.Add("@FIXEDGRADE", SqlDbType.NVarChar).Value = FixGrade;
            cmd.Parameters.Add("@WAGEDAY", SqlDbType.NVarChar).Value = WageDay;
            cmd.Parameters.Add("@EPFWAGEDAY", SqlDbType.NVarChar).Value = EpfWageDay;
            cmd.Parameters.Add("@WORKDAYS", SqlDbType.NVarChar).Value = WrkDays;

            cmd.Parameters.Add("@ET1", SqlDbType.NVarChar).Value = ET1;
            cmd.Parameters.Add("@ET2", SqlDbType.NVarChar).Value = ET2;
            cmd.Parameters.Add("@ET3", SqlDbType.NVarChar).Value = ET3;


            cmd.Parameters.Add("@BASICDA", SqlDbType.NVarChar).Value = Basic;
            cmd.Parameters.Add("@HRA", SqlDbType.NVarChar).Value = Hra;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.Decimal).Value = Convey;
            cmd.Parameters.Add("@WASHING", SqlDbType.NVarChar).Value = Washing;

            cmd.Parameters.Add("@A1", SqlDbType.NVarChar).Value = A1;
            cmd.Parameters.Add("@A2", SqlDbType.NVarChar).Value = A2;
            cmd.Parameters.Add("@A3", SqlDbType.NVarChar).Value = A3;
            cmd.Parameters.Add("@A4", SqlDbType.NVarChar).Value = A4;
            cmd.Parameters.Add("@A5", SqlDbType.NVarChar).Value = A5;
            cmd.Parameters.Add("@A6", SqlDbType.NVarChar).Value = A6;
            cmd.Parameters.Add("@A7", SqlDbType.NVarChar).Value = A7;
            cmd.Parameters.Add("@A8", SqlDbType.NVarChar).Value = A8;
            cmd.Parameters.Add("@A9", SqlDbType.NVarChar).Value = A9;

            cmd.Parameters.Add("@TOTALWAGE", SqlDbType.NVarChar).Value = TotalWg;

            cmd.Parameters.Add("@TOTALOTAMOUNT1", SqlDbType.NVarChar).Value = OTAmount1;
            cmd.Parameters.Add("@TOTALOTAMOUNT2", SqlDbType.NVarChar).Value = OTAmount2;
            cmd.Parameters.Add("@TOTALOTAMOUNT3", SqlDbType.NVarChar).Value = OTAmount3;

            cmd.Parameters.Add("@TOTALEXTRA", SqlDbType.NVarChar).Value = TotExtra;
            cmd.Parameters.Add("@TOTALGROSS", SqlDbType.NVarChar).Value = TotGross;
            cmd.Parameters.Add("@EPFWAGE", SqlDbType.Decimal).Value = EpfWage;
            cmd.Parameters.Add("@EPF", SqlDbType.NVarChar).Value = Epf;
            cmd.Parameters.Add("@ESIWAGE", SqlDbType.NVarChar).Value = EsiWage;
            cmd.Parameters.Add("@ESI", SqlDbType.NVarChar).Value = Esi;
            cmd.Parameters.Add("@ADVANCE", SqlDbType.NVarChar).Value = Advance;

            cmd.Parameters.Add("@D1", SqlDbType.NVarChar).Value = D1;
            cmd.Parameters.Add("@D2", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D3", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D4", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D5", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D6", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D7", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D8", SqlDbType.NVarChar).Value = D2;

            cmd.Parameters.Add("@TOTALDEDUCTION", SqlDbType.NVarChar).Value = TotDeduct;
            cmd.Parameters.Add("@NETWAGE", SqlDbType.NVarChar).Value = Netwage;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteMonthlyPayrollDtl(string FromDate, string ToDate,  string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollDtlDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);            
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Decimal).Value = ClntID;            
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteMonthlyPayrollDtlForReportJ(string FromDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollDtlForReportJDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Decimal).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteMonthlyPayrollHdr(string FromDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollHdrForReportJDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Decimal).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteMonthlyPayrollHdrForReportJ(string FromDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollHdrForReportJDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FromDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Decimal).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        // EmployeeTransfer

        public void InsertEmployeeTransfer(string Date, string EmpID, string EmpCode, string CurClntID, string CurDpt, string CurJbType, string ChngClntID, 
            string ChngDpt, string ChngJbType, string Reason, string CurDesg, string ChngDesg)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeTransferInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.Int).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@CURRENTCLIENTID", SqlDbType.Int).Value = CurClntID;
            cmd.Parameters.Add("@CURRENTDEPARTMENTID", SqlDbType.Int).Value = CurDpt;
            cmd.Parameters.Add("@CURRENTDESIGNATIONID", SqlDbType.Int).Value = CurDesg;
            cmd.Parameters.Add("@CURRENTJOBTYPE", SqlDbType.NVarChar).Value = CurJbType;
            cmd.Parameters.Add("@CHANGECLIENTID", SqlDbType.Int).Value = ChngClntID;
            cmd.Parameters.Add("@CHANGEDEPARTMENTID", SqlDbType.Int).Value = ChngDpt;
            cmd.Parameters.Add("@CHANGEDESIGNATIONID", SqlDbType.Int).Value = ChngDesg;
            cmd.Parameters.Add("@CHANGEJOBTYPE", SqlDbType.NVarChar).Value = ChngJbType;
            cmd.Parameters.Add("@REASON", SqlDbType.NVarChar).Value = Reason;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateEmployeeTransfer(string EmpTranID, string Date, string EmpID, string EmpCode, string CurClntID, string CurDpt, string CurJbType, string ChngClntID, string ChngDpt, string ChngJbType
                                            , string Reason, string CurDesg, string ChngDesg)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeTransferUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPTRANSFERID", SqlDbType.Int).Value = EmpTranID;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value =Convert.ToDateTime(Date);
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.Int).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@CURRENTCLIENTID", SqlDbType.Int).Value = CurClntID;
            cmd.Parameters.Add("@CURRENTDEPARTMENTID", SqlDbType.Int).Value = CurDpt;
            cmd.Parameters.Add("@CURRENTDESIGNATIONID", SqlDbType.Int).Value = CurDesg;
            cmd.Parameters.Add("@CURRENTJOBTYPE", SqlDbType.NVarChar).Value = CurJbType;
            cmd.Parameters.Add("@CHANGECLIENTID", SqlDbType.Int).Value = ChngClntID;
            cmd.Parameters.Add("@CHANGEDEPARTMENTID", SqlDbType.Int).Value = ChngDpt;
            cmd.Parameters.Add("@CHANGEDESIGNATIONID", SqlDbType.Int).Value = ChngDesg;
            cmd.Parameters.Add("@CHANGEJOBTYPE", SqlDbType.NVarChar).Value = ChngJbType;
            cmd.Parameters.Add("@REASON", SqlDbType.NVarChar).Value = Reason;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateEmployeeTransferMaster(string ClntID, string DptID, string EmpID, string JbType)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeTransferUpdateMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.Int).Value = DptID;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.Int).Value = EmpID;
            cmd.Parameters.Add("@JOBTYPE", SqlDbType.NVarChar).Value = JbType;            
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public object SelectEmployeeTransfer()
        {

            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeTransferSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;         
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // -----------MDBreakUp

        public object SelectMDBreakUp(string FrmDt,string ToDt, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MDBreakUpSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void DeleteMDBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MDBreakUpDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateMDBreakUpConf(string FrmDt, string ToDt, string ClntID, string Flag)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MDBreakUpConfUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@Flag", SqlDbType.Int).Value = Flag;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        // -----------ETBreakUp
        public void DeleteETBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ETBreakUpDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public object SelectETBreakUp(string FrmDt, string ToDt, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ETBreakUpSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void UpdateETBreakUpConf(string FrmDt, string ToDt, string ClntID, string Flag)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ETBreakUpConfUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@Flag", SqlDbType.Int).Value = Flag;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        // Employee Detail Reports

        public DataSet SelectEmployeeReport(string FrmDt, string ToDt, string ClntID, string DtpID, string DesgID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeReportSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = '%' + DtpID + '%' ;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.NVarChar).Value = '%' + DesgID + '%';
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        // Payslip

        public DataTable SelectEmployeeCodeOnUnit(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeCodeOnUnitSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataSet SelectMonthlyPaySlip(string ClntID, string FrmDate, string ToDate, string EmpName)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPaySlip", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntID;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(FrmDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ToDate);
            cmd.Parameters.Add("@APPLICATIONAME", SqlDbType.NVarChar).Value = "%" + EmpName + "%";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        // Payment

        public void InsertPaymentDetail(string InvNo, string InvDt, string ClntName, string Div, string Grdtot, string SerTax, string NetAmt, string TDS, 
            string Insur, string Canteen, string BillReCover, string Paid, string Balance, string Status, string ChequeNo, string Amount, 
            string ChqDate, string ClrDate)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PaymentDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.NVarChar).Value = InvNo;
            cmd.Parameters.Add("@INVOICEDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(InvDt);
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Div;
            cmd.Parameters.Add("@GRANDTOTAL", SqlDbType.NVarChar).Value = Grdtot;
            cmd.Parameters.Add("@SERVICETAX", SqlDbType.NVarChar).Value = SerTax;
            cmd.Parameters.Add("@NETAMOUNT", SqlDbType.NVarChar).Value = NetAmt;
            cmd.Parameters.Add("@TDS", SqlDbType.NVarChar).Value = TDS;
            cmd.Parameters.Add("@INSURANCE", SqlDbType.NVarChar).Value = Insur;
            cmd.Parameters.Add("@CANTEEN", SqlDbType.NVarChar).Value = Canteen;
            cmd.Parameters.Add("@BILLRECOVER", SqlDbType.NVarChar).Value = BillReCover;
            cmd.Parameters.Add("@PAID", SqlDbType.NVarChar).Value = Paid;
            cmd.Parameters.Add("@BALANCE", SqlDbType.NVarChar).Value = Balance;
            cmd.Parameters.Add("@STATUS", SqlDbType.NVarChar).Value = Status;
            cmd.Parameters.Add("@CHEQUENO", SqlDbType.NVarChar).Value = ChequeNo;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.NVarChar).Value = Amount;
            cmd.Parameters.Add("@CHEQUEDATE", SqlDbType.DateTime).Value = DateTime.Parse(ChqDate);
            cmd.Parameters.Add("@CLEARDATE", SqlDbType.DateTime).Value = DateTime.Parse(ClrDate);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdatePaymentDetail(string PayID, string InvNo, string InvDt, string ClntName, string Div, string Grdtot, string SerTax, string NetAmt, string TDS,
            string Insur, string Canteen, string BillReCover, string Paid, string Balance, string Status, string ChequeNo, string Amount,
            string ChqDate, string ClrDate)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PaymentDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PAYMENTID", SqlDbType.Int).Value = PayID;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.NVarChar).Value = InvNo;
            cmd.Parameters.Add("@INVOICEDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(InvDt);
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Div;
            cmd.Parameters.Add("@GRANDTOTAL", SqlDbType.NVarChar).Value = Grdtot;
            cmd.Parameters.Add("@SERVICETAX", SqlDbType.NVarChar).Value = SerTax;
            cmd.Parameters.Add("@NETAMOUNT", SqlDbType.NVarChar).Value = NetAmt;
            cmd.Parameters.Add("@TDS", SqlDbType.NVarChar).Value = TDS;
            cmd.Parameters.Add("@INSURANCE", SqlDbType.NVarChar).Value = Insur;
            cmd.Parameters.Add("@CANTEEN", SqlDbType.NVarChar).Value = Canteen;
            cmd.Parameters.Add("@BILLRECOVER", SqlDbType.NVarChar).Value = BillReCover;
            cmd.Parameters.Add("@PAID", SqlDbType.NVarChar).Value = Paid;
            cmd.Parameters.Add("@BALANCE", SqlDbType.NVarChar).Value = Balance;
            cmd.Parameters.Add("@STATUS", SqlDbType.NVarChar).Value = Status;
            cmd.Parameters.Add("@CHEQUENO", SqlDbType.NVarChar).Value = ChequeNo;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.NVarChar).Value = Amount;
            cmd.Parameters.Add("@CHEQUEDATE", SqlDbType.DateTime).Value = DateTime.Parse(ChqDate);
            cmd.Parameters.Add("@CLEARDATE", SqlDbType.DateTime).Value = DateTime.Parse(ClrDate);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }


        public DataTable SelectPaymentDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PaymentDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // Advance

        public void InsertAdvanceDetail(string Date, string AdvCode, string EmpID, string ClntID, string Amount, string Remark, string Status)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AdvanceDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@ADVANCECODE", SqlDbType.NVarChar).Value = AdvCode;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.Int).Value = EmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.NVarChar).Value = Amount;
            cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = Remark;
            cmd.Parameters.Add("@STATUS", SqlDbType.Int).Value = Status;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void AdvanceDetailUpdate(string AdvID, string Date, string AdvCode, string EmpID, string ClntID, string Amount, string Remark, string Status)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AdvanceDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ADVANCEID", SqlDbType.Int).Value = AdvID;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@ADVANCECODE", SqlDbType.NVarChar).Value = AdvCode;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.Int).Value = EmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.NVarChar).Value = Amount;
            cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = Remark;
            cmd.Parameters.Add("@STATUS", SqlDbType.NVarChar).Value = Status;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectAdvanceDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("AdvanceDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeName(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeNameSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectEmployeeNameDetail(string EmpID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("EmployeeNameDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = EmpID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //----Petty Cash Reason

        public void PettyCashReasonInsert(string CASHREASON)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PettyCashReasonInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CASHREASON", SqlDbType.NVarChar).Value = CASHREASON;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void PettyCashReasonUpdate(string CASHREASON, string DESID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PettyCashReasonUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CASHREASON", SqlDbType.VarChar).Value = CASHREASON;
            cmd.Parameters.Add("@DESID", SqlDbType.VarChar).Value = DESID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable PettyCashReasonSelect()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PettyCashReasonSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        // ----- Cash In

        public void InsertCashInDetail(string Date, string CashFm, string ClntName, string Divi, string Reason, string EmpCode, string Dept, 
            string Remark, string TwoThou, string FiveHund, string TwoHund, string Hund, string Fifty, string Twenty, string Ten, string Five, string Two, string One, string Total)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashInDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CASHDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@CASHFROM", SqlDbType.NVarChar).Value = CashFm;
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DIVISIONNAME", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@REASON", SqlDbType.NVarChar).Value = Reason;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENT", SqlDbType.NVarChar).Value = Dept;
            cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = Remark;
            cmd.Parameters.Add("@2000", SqlDbType.Decimal).Value = TwoThou;
            cmd.Parameters.Add("@500", SqlDbType.Decimal).Value = FiveHund;
            cmd.Parameters.Add("@200", SqlDbType.Decimal).Value = TwoHund;
            cmd.Parameters.Add("@100", SqlDbType.Decimal).Value = Hund;
            cmd.Parameters.Add("@50", SqlDbType.Decimal).Value = Fifty;
            cmd.Parameters.Add("@20", SqlDbType.Decimal).Value = Twenty;
            cmd.Parameters.Add("@10", SqlDbType.Decimal).Value = Ten;
            cmd.Parameters.Add("@5", SqlDbType.Decimal).Value = Five;
            cmd.Parameters.Add("@2", SqlDbType.Decimal).Value = Two;
            cmd.Parameters.Add("@1", SqlDbType.Decimal).Value = One;
            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = Total;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateCashInDetail(string CashId, string Date, string CashFm, string ClntName, string Divi, string Reason, string EmpCode, string Dept,
            string Remark, string TwoThou, string FiveHund, string TwoHund, string Hund, string Fifty, string Twenty, string Ten, string Five, string Two, string One, string Total)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashInDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CASHID", SqlDbType.Int).Value = CashId;
            cmd.Parameters.Add("@CASHDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@CASHFROM", SqlDbType.NVarChar).Value = CashFm;
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DIVISIONNAME", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@REASON", SqlDbType.NVarChar).Value = Reason;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENT", SqlDbType.NVarChar).Value = Dept;
            cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = Remark;
            cmd.Parameters.Add("@2000", SqlDbType.Decimal).Value = TwoThou;
            cmd.Parameters.Add("@500", SqlDbType.Decimal).Value = FiveHund;
            cmd.Parameters.Add("@200", SqlDbType.Decimal).Value = TwoHund;
            cmd.Parameters.Add("@100", SqlDbType.Decimal).Value = Hund;
            cmd.Parameters.Add("@50", SqlDbType.Decimal).Value = Fifty;
            cmd.Parameters.Add("@20", SqlDbType.Decimal).Value = Twenty;
            cmd.Parameters.Add("@10", SqlDbType.Decimal).Value = Ten;
            cmd.Parameters.Add("@5", SqlDbType.Decimal).Value = Five;
            cmd.Parameters.Add("@2", SqlDbType.Decimal).Value = Two;
            cmd.Parameters.Add("@1", SqlDbType.Decimal).Value = One;
            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = Total;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectCashInDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashInDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataSet SelectCashInDetailReport()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashInDetailReport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }



        // ----- Cash Out

        public void InsertCashOutDetail(string TransID, string Date, string CashTo, string ClntName, string Dept, string Cash, string Remark,
           string AdvCode, string EmpName, string Divi, string EmpCode, string BillNo, string Amount,
             string HTwoThou, string HFiveHund, string HTwoHund, string HHund, string HFifty, string HTwenty, string HTen, string HFive, string HTwo, 
             string HOne, string HTotal, string DTwoThou, string DFiveHund, string DTwoHund, string DHund, string DFifty, string DTwenty, string DTen, string DFive, string DTwo,
             string DOne, string DTotal)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOutDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;            
            cmd.Parameters.Add("@TRANSACTIONID", SqlDbType.NVarChar).Value = TransID;
            cmd.Parameters.Add("@CASHDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@CASHTO", SqlDbType.NVarChar).Value = CashTo;
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DEPARTMENT", SqlDbType.NVarChar).Value = Dept;
            cmd.Parameters.Add("@CASH", SqlDbType.NVarChar).Value = Cash;
            cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = Remark;
            cmd.Parameters.Add("@ADVANCECODE", SqlDbType.NVarChar).Value = AdvCode;
            cmd.Parameters.Add("@EMPLOYEENAME", SqlDbType.NVarChar).Value = EmpName;
            cmd.Parameters.Add("@DIVISIONNAME", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@BILLNO", SqlDbType.NVarChar).Value = BillNo;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.NVarChar).Value = Amount;

            cmd.Parameters.Add("@HAND2000", SqlDbType.Decimal).Value = HTwoThou;
            cmd.Parameters.Add("@HAND500", SqlDbType.Decimal).Value = HFiveHund;
            cmd.Parameters.Add("@HAND200", SqlDbType.Decimal).Value = HTwoHund;
            cmd.Parameters.Add("@HAND100", SqlDbType.Decimal).Value = HHund;
            cmd.Parameters.Add("@HAND50", SqlDbType.Decimal).Value = HFifty;
            cmd.Parameters.Add("@HAND20", SqlDbType.Decimal).Value = HTwenty;
            cmd.Parameters.Add("@HAND10", SqlDbType.Decimal).Value = HTen;
            cmd.Parameters.Add("@HAND5", SqlDbType.Decimal).Value = HFive;
            cmd.Parameters.Add("@HAND2", SqlDbType.Decimal).Value = HTwo;
            cmd.Parameters.Add("@HAND1", SqlDbType.Decimal).Value = HOne;
            cmd.Parameters.Add("@HANDTOTAL", SqlDbType.Decimal).Value = HTotal;

            cmd.Parameters.Add("@DINO2000", SqlDbType.Decimal).Value = DTwoThou;
            cmd.Parameters.Add("@DINO500", SqlDbType.Decimal).Value = DFiveHund;
            cmd.Parameters.Add("@DINO200", SqlDbType.Decimal).Value = DTwoHund;
            cmd.Parameters.Add("@DINO100", SqlDbType.Decimal).Value = DHund;
            cmd.Parameters.Add("@DINO50", SqlDbType.Decimal).Value = DFifty;
            cmd.Parameters.Add("@DINO20", SqlDbType.Decimal).Value = DTwenty;
            cmd.Parameters.Add("@DINO10", SqlDbType.Decimal).Value = DTen;
            cmd.Parameters.Add("@DINO5", SqlDbType.Decimal).Value = DFive;
            cmd.Parameters.Add("@DINO2", SqlDbType.Decimal).Value = DTwo;
            cmd.Parameters.Add("@DINO1", SqlDbType.Decimal).Value = DOne;
            cmd.Parameters.Add("@DINOTOTAL", SqlDbType.Decimal).Value = DTotal;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }


        public void UpdateCashOutDetail(string CashOutId, string TransID, string Date, string CashTo, string ClntName, string Dept, string Cash, string Remark,
           string AdvCode, string EmpName, string Divi, string EmpCode, string BillNo, string Amount,
             string HTwoThou, string HFiveHund, string HTwoHund, string HHund, string HFifty, string HTwenty, string HTen, string HFive, string HTwo,
             string HOne, string HTotal, string DTwoThou, string DFiveHund, string DTwoHund, string DHund, string DFifty, string DTwenty, string DTen, string DFive, string DTwo,
             string DOne, string DTotal)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOutDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CASHOUTID", SqlDbType.Int).Value = CashOutId;
            cmd.Parameters.Add("@TRANSACTIONID", SqlDbType.NVarChar).Value = TransID;
            cmd.Parameters.Add("@CASHDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            cmd.Parameters.Add("@CASHTO", SqlDbType.NVarChar).Value = CashTo;
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClntName;
            cmd.Parameters.Add("@DEPARTMENT", SqlDbType.NVarChar).Value = Dept;
            cmd.Parameters.Add("@CASH", SqlDbType.NVarChar).Value = Cash;
            cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = Remark;
            cmd.Parameters.Add("@ADVANCECODE", SqlDbType.NVarChar).Value = AdvCode;
            cmd.Parameters.Add("@EMPLOYEENAME", SqlDbType.NVarChar).Value = EmpName;
            cmd.Parameters.Add("@DIVISIONNAME", SqlDbType.NVarChar).Value = Divi;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@BILLNO", SqlDbType.NVarChar).Value = BillNo;
            cmd.Parameters.Add("@AMOUNT", SqlDbType.NVarChar).Value = Amount;

            cmd.Parameters.Add("@HAND2000", SqlDbType.Decimal).Value = HTwoThou;
            cmd.Parameters.Add("@HAND500", SqlDbType.Decimal).Value = HFiveHund;
            cmd.Parameters.Add("@HAND200", SqlDbType.Decimal).Value = HTwoHund;
            cmd.Parameters.Add("@HAND100", SqlDbType.Decimal).Value = HHund;
            cmd.Parameters.Add("@HAND50", SqlDbType.Decimal).Value = HFifty;
            cmd.Parameters.Add("@HAND20", SqlDbType.Decimal).Value = HTwenty;
            cmd.Parameters.Add("@HAND10", SqlDbType.Decimal).Value = HTen;
            cmd.Parameters.Add("@HAND5", SqlDbType.Decimal).Value = HFive;
            cmd.Parameters.Add("@HAND2", SqlDbType.Decimal).Value = HTwo;
            cmd.Parameters.Add("@HAND1", SqlDbType.Decimal).Value = HOne;
            cmd.Parameters.Add("@HANDTOTAL", SqlDbType.Decimal).Value = HTotal;

            cmd.Parameters.Add("@DINO2000", SqlDbType.Decimal).Value = DTwoThou;
            cmd.Parameters.Add("@DINO500", SqlDbType.Decimal).Value = DFiveHund;
            cmd.Parameters.Add("@DINO200", SqlDbType.Decimal).Value = DTwoHund;
            cmd.Parameters.Add("@DINO100", SqlDbType.Decimal).Value = DHund;
            cmd.Parameters.Add("@DINO50", SqlDbType.Decimal).Value = DFifty;
            cmd.Parameters.Add("@DINO20", SqlDbType.Decimal).Value = DTwenty;
            cmd.Parameters.Add("@DINO10", SqlDbType.Decimal).Value = DTen;
            cmd.Parameters.Add("@DINO5", SqlDbType.Decimal).Value = DFive;
            cmd.Parameters.Add("@DINO2", SqlDbType.Decimal).Value = DTwo;
            cmd.Parameters.Add("@DINO1", SqlDbType.Decimal).Value = DOne;
            cmd.Parameters.Add("@DINOTOTAL", SqlDbType.Decimal).Value = DTotal;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectCashOutDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOutDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataSet SelectCashOutDetailReport()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOutDetailReport", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        // ------ Income Entry

        public void InsertIncomeEntryDetail(string ClntID, string IncmMonth, string CompName, string Addr1, string Addr2, string Addr3, string Cont, string BillNo,
           string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("IncomeEntryDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@INCOMEMONTH", SqlDbType.NVarChar).Value = IncmMonth;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CompName;
            cmd.Parameters.Add("@ADDRESS1", SqlDbType.NVarChar).Value = Addr1;
            cmd.Parameters.Add("@ADDRESS2", SqlDbType.NVarChar).Value = Addr2;
            cmd.Parameters.Add("@ADDRESS3", SqlDbType.NVarChar).Value = Addr3;
            cmd.Parameters.Add("@CONTACT", SqlDbType.NVarChar).Value = Cont;
            cmd.Parameters.Add("@BILLNO", SqlDbType.NVarChar).Value = BillNo;
            cmd.Parameters.Add("@BILLDESCRIP", SqlDbType.NVarChar).Value = BillSrcp;
            cmd.Parameters.Add("@BILLAMOUNT", SqlDbType.Decimal).Value = BillAmt;
            cmd.Parameters.Add("@PAYMENTMODE", SqlDbType.NVarChar).Value = PayMode;
            cmd.Parameters.Add("@CHEQUE", SqlDbType.NVarChar).Value = Cheque;
            if (Date == "")
            {
                cmd.Parameters.Add("@DATE", SqlDbType.NVarChar).Value = Date;
            }
            else
            {
                cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            }                       
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateIncomeEntryDetail(string IncmID, string ClntID, string IncmMonth, string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
          string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("IncomeEntryDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@INCOMEID", SqlDbType.Int).Value = IncmID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@INCOMEMONTH", SqlDbType.NVarChar).Value = IncmMonth;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CompName;
            cmd.Parameters.Add("@ADDRESS1", SqlDbType.NVarChar).Value = Addr1;
            cmd.Parameters.Add("@ADDRESS2", SqlDbType.NVarChar).Value = Addr2;
            cmd.Parameters.Add("@ADDRESS3", SqlDbType.NVarChar).Value = Addr3;
            cmd.Parameters.Add("@CONTACT", SqlDbType.NVarChar).Value = Cont;
            cmd.Parameters.Add("@BILLNO", SqlDbType.NVarChar).Value = BillNo;
            cmd.Parameters.Add("@BILLDESCRIP", SqlDbType.NVarChar).Value = BillSrcp;
            cmd.Parameters.Add("@BILLAMOUNT", SqlDbType.Decimal).Value = BillAmt;
            cmd.Parameters.Add("@PAYMENTMODE", SqlDbType.NVarChar).Value = PayMode;
            cmd.Parameters.Add("@CHEQUE", SqlDbType.NVarChar).Value = Cheque;             
            if (Date == "")
            {
                cmd.Parameters.Add("@DATE", SqlDbType.NVarChar).Value = Date;
            }
            else
            {
                cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            }
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectIncomeEntryDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("IncomeEntryDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // ------ Expenses Entry

        public void InsertExpensesEntryDetail(string ClntID, string ExpenMonth, string AvbBalance,  string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
           string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ExpensesEntryDetailInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@EXPENSESMONTH", SqlDbType.NVarChar).Value = ExpenMonth;
            cmd.Parameters.Add("@AVBBALANCE", SqlDbType.Decimal).Value = AvbBalance;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CompName;
            cmd.Parameters.Add("@ADDRESS1", SqlDbType.NVarChar).Value = Addr1;
            cmd.Parameters.Add("@ADDRESS2", SqlDbType.NVarChar).Value = Addr2;
            cmd.Parameters.Add("@ADDRESS3", SqlDbType.NVarChar).Value = Addr3;
            cmd.Parameters.Add("@CONTACT", SqlDbType.NVarChar).Value = Cont;
            cmd.Parameters.Add("@BILLNO", SqlDbType.NVarChar).Value = BillNo;
            cmd.Parameters.Add("@BILLDESCRIP", SqlDbType.NVarChar).Value = BillSrcp;
            cmd.Parameters.Add("@BILLAMOUNT", SqlDbType.Decimal).Value = BillAmt;
            cmd.Parameters.Add("@PAYMENTMODE", SqlDbType.NVarChar).Value = PayMode;
            cmd.Parameters.Add("@CHEQUE", SqlDbType.NVarChar).Value = Cheque;             
            if (Date == "")
            {
                cmd.Parameters.Add("@DATE", SqlDbType.NVarChar).Value = Date;
            }
            else
            {
                cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            }
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }


        public void UpdateExpensesEntryDetail(string ExpenID, string ClntID, string ExpenMonth, string AvbBalance, string CompName, string Addr1, string Addr2, string Addr3, string BillNo, string Cont,
          string BillSrcp, string BillAmt, string PayMode, string Cheque, string Date)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ExpensesEntryDetailUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EXPENSESID", SqlDbType.Int).Value = ExpenID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@EXPENSESMONTH", SqlDbType.NVarChar).Value = ExpenMonth;
            cmd.Parameters.Add("@AVBBALANCE", SqlDbType.Decimal).Value = AvbBalance;
            cmd.Parameters.Add("@COMPANYNAME", SqlDbType.NVarChar).Value = CompName;
            cmd.Parameters.Add("@ADDRESS1", SqlDbType.NVarChar).Value = Addr1;
            cmd.Parameters.Add("@ADDRESS2", SqlDbType.NVarChar).Value = Addr2;
            cmd.Parameters.Add("@ADDRESS3", SqlDbType.NVarChar).Value = Addr3;
            cmd.Parameters.Add("@CONTACT", SqlDbType.NVarChar).Value = Cont;
            cmd.Parameters.Add("@BILLNO", SqlDbType.NVarChar).Value = BillNo;
            cmd.Parameters.Add("@BILLDESCRIP", SqlDbType.NVarChar).Value = BillSrcp;
            cmd.Parameters.Add("@BILLAMOUNT", SqlDbType.Decimal).Value = BillAmt;
            cmd.Parameters.Add("@PAYMENTMODE", SqlDbType.NVarChar).Value = PayMode;
            cmd.Parameters.Add("@CHEQUE", SqlDbType.NVarChar).Value = Cheque;
             
            if (Date == "")
            {
                cmd.Parameters.Add("@DATE", SqlDbType.NVarChar).Value = Date;
            }
            else
            {
                cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = Convert.ToDateTime(Date);
            }
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectExpensesEntryDetail()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ExpensesEntryDetailSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // ------ Expenses Entry 


        public void InsertInvoiceValueMaster(string ClntID, string PFWage, string ESIWage, 
            string BonusWage, string GratuWage, string LeaveWage, string LWF, string SerCharge, string CGST,
       string IGST, string SGST, string CESS, string TotalCharge)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InvoiceValueMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;          
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@PFWAGES", SqlDbType.Decimal).Value = PFWage;
            cmd.Parameters.Add("@ESIWAGES", SqlDbType.Decimal).Value = ESIWage;
            cmd.Parameters.Add("@BONUSWAGE", SqlDbType.Decimal).Value = BonusWage;
            cmd.Parameters.Add("@GRATUITYWAGE", SqlDbType.Decimal).Value = GratuWage;
            cmd.Parameters.Add("@LEAVEWAGE", SqlDbType.Decimal).Value = LeaveWage;
            cmd.Parameters.Add("@LWF", SqlDbType.Decimal).Value = LWF;
            cmd.Parameters.Add("@SERVICECHARGE", SqlDbType.Decimal).Value = SerCharge;
            cmd.Parameters.Add("@CGST", SqlDbType.Decimal).Value = CGST;
            cmd.Parameters.Add("@IGST", SqlDbType.Decimal).Value = IGST;
            cmd.Parameters.Add("@SGST", SqlDbType.Decimal).Value = SGST;
            cmd.Parameters.Add("@CESS", SqlDbType.Decimal).Value = CESS;
            cmd.Parameters.Add("@TOTALCHARGE", SqlDbType.Decimal).Value = TotalCharge;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }


        public void UpdateInvoiceValueMaster(string InvID, string ClntID, string PFWage, string ESIWage,
            string BonusWage, string GratuWage, string LeaveWage, string LWF, string SerCharge, string CGST,
           string IGST, string SGST, string CESS, string TotalCharge)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InvoiceValueMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@INVOICEDTID", SqlDbType.Int).Value = InvID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@PFWAGES", SqlDbType.Decimal).Value = PFWage;
            cmd.Parameters.Add("@ESIWAGES", SqlDbType.Decimal).Value = ESIWage;
            cmd.Parameters.Add("@BONUSWAGE", SqlDbType.Decimal).Value = BonusWage;
            cmd.Parameters.Add("@GRATUITYWAGE", SqlDbType.Decimal).Value = GratuWage;
            cmd.Parameters.Add("@LEAVEWAGE", SqlDbType.Decimal).Value = LeaveWage;
            cmd.Parameters.Add("@LWF", SqlDbType.Decimal).Value = LWF;
            cmd.Parameters.Add("@SERVICECHARGE", SqlDbType.Decimal).Value = SerCharge;
            cmd.Parameters.Add("@CGST", SqlDbType.Decimal).Value = CGST;
            cmd.Parameters.Add("@IGST", SqlDbType.Decimal).Value = IGST;
            cmd.Parameters.Add("@SGST", SqlDbType.Decimal).Value = SGST;
            cmd.Parameters.Add("@CESS", SqlDbType.Decimal).Value = CESS;
            cmd.Parameters.Add("@TOTALCHARGE", SqlDbType.Decimal).Value = TotalCharge;
            
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectInvoiceValueMaster()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InvoiceValueMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectInvoiceValueMasterClnt(string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("InvoiceValueMasterClntSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // ------ Cash On Hand Entry 

        public void InsertCashOnHand(string Date, string S2000, string S500, string S200, string S100, string S50, string S20, string S10, string S5,
      string S2, string S1, string TotAmount, string Tot2000, string Tot500, string Tot200, string Tot100, string Tot50, string Tot20, 
      string Tot10, string Tot5, string Tot2, string Tot1)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOnHandInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@2000S", SqlDbType.Int).Value = S2000;
            cmd.Parameters.Add("@500S", SqlDbType.Decimal).Value = S500;
            cmd.Parameters.Add("@200S", SqlDbType.Decimal).Value = S200;
            cmd.Parameters.Add("@100S", SqlDbType.Decimal).Value = S100;
            cmd.Parameters.Add("@50S", SqlDbType.Decimal).Value = S50;
            cmd.Parameters.Add("@20S", SqlDbType.Decimal).Value = S20;
            cmd.Parameters.Add("@10S", SqlDbType.Decimal).Value = S10;
            cmd.Parameters.Add("@5S", SqlDbType.Decimal).Value = S5;
            cmd.Parameters.Add("@2S", SqlDbType.Decimal).Value = S2;
            cmd.Parameters.Add("@1S", SqlDbType.Decimal).Value = S1;
            cmd.Parameters.Add("@TOTALAMOUNT", SqlDbType.Decimal).Value = TotAmount;
            cmd.Parameters.Add("@TOT2000", SqlDbType.Decimal).Value = Tot2000;
            cmd.Parameters.Add("@TOT500", SqlDbType.Decimal).Value = Tot500;
            cmd.Parameters.Add("@TOT200", SqlDbType.Decimal).Value = Tot200;
            cmd.Parameters.Add("@TOT100", SqlDbType.Decimal).Value = Tot100;
            cmd.Parameters.Add("@TOT50", SqlDbType.Decimal).Value = Tot50;
            cmd.Parameters.Add("@TOT20", SqlDbType.Decimal).Value = Tot20;
            cmd.Parameters.Add("@TOT10", SqlDbType.Decimal).Value = Tot10;
            cmd.Parameters.Add("@TOT5", SqlDbType.Decimal).Value = Tot5;
            cmd.Parameters.Add("@TOT2", SqlDbType.Decimal).Value = Tot2;
            cmd.Parameters.Add("@TOT1", SqlDbType.Decimal).Value = Tot1;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateCashOnHand(string CashID, string Date, string S2000, string S500, string S200, string S100, string S50, string S20, string S10, string S5,
     string S2, string S1, string TotAmount, string Tot2000, string Tot500, string Tot200, string Tot100, string Tot50, string Tot20,
     string Tot10, string Tot5, string Tot2, string Tot1)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOnHandUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CASHONHANDID", SqlDbType.Int).Value = CashID;
            cmd.Parameters.Add("@DATE", SqlDbType.DateTime).Value = DateTime.Parse(Date);
            cmd.Parameters.Add("@2000S", SqlDbType.Int).Value = S2000;
            cmd.Parameters.Add("@500S", SqlDbType.Decimal).Value = S500;
            cmd.Parameters.Add("@200S", SqlDbType.Decimal).Value = S200;
            cmd.Parameters.Add("@100S", SqlDbType.Decimal).Value = S100;
            cmd.Parameters.Add("@50S", SqlDbType.Decimal).Value = S50;
            cmd.Parameters.Add("@20S", SqlDbType.Decimal).Value = S20;
            cmd.Parameters.Add("@10S", SqlDbType.Decimal).Value = S10;
            cmd.Parameters.Add("@5S", SqlDbType.Decimal).Value = S5;
            cmd.Parameters.Add("@2S", SqlDbType.Decimal).Value = S2;
            cmd.Parameters.Add("@1S", SqlDbType.Decimal).Value = S1;
            cmd.Parameters.Add("@TOTALAMOUNT", SqlDbType.Decimal).Value = TotAmount;
            cmd.Parameters.Add("@TOT2000", SqlDbType.Decimal).Value = Tot2000;
            cmd.Parameters.Add("@TOT500", SqlDbType.Decimal).Value = Tot500;
            cmd.Parameters.Add("@TOT200", SqlDbType.Decimal).Value = Tot200;
            cmd.Parameters.Add("@TOT100", SqlDbType.Decimal).Value = Tot100;
            cmd.Parameters.Add("@TOT50", SqlDbType.Decimal).Value = Tot50;
            cmd.Parameters.Add("@TOT20", SqlDbType.Decimal).Value = Tot20;
            cmd.Parameters.Add("@TOT10", SqlDbType.Decimal).Value = Tot10;
            cmd.Parameters.Add("@TOT5", SqlDbType.Decimal).Value = Tot5;
            cmd.Parameters.Add("@TOT2", SqlDbType.Decimal).Value = Tot2;
            cmd.Parameters.Add("@TOT1", SqlDbType.Decimal).Value = Tot1;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectCashOnHand()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("CashOnHandSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // ------ Department Value Setting Entry 

        public void InsertDepartmentValueMaster(string ClntID, string CmpID, string DayRate, string OTRate, string DptID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentValueMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.Int).Value = CmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.Int).Value = DptID;
            cmd.Parameters.Add("@DAYRATE", SqlDbType.Decimal).Value = DayRate;
            cmd.Parameters.Add("@OTRATE", SqlDbType.Decimal).Value = OTRate;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateDepartmentValueMaster(string DptValID, string ClntID, string CmpID, string DayRate, string OTRate, string DptID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentValueMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DPTVALID", SqlDbType.Int).Value = DptValID;
            cmd.Parameters.Add("@COMPANYID", SqlDbType.Int).Value = CmpID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.Int).Value = DptID;
            cmd.Parameters.Add("@DAYRATE", SqlDbType.Decimal).Value = DayRate;
            cmd.Parameters.Add("@OTRATE", SqlDbType.Decimal).Value = OTRate;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectDepartmentValueMaster()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("DepartmentValueMasterSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        //----- Regular Bill
        public DataTable SelectRegularBillCalc(string FrmDate, string ToDate, string ClntID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillCalcSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FrmDate);
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataSet SelectRegularBillCalcReport(string FrmDate, string ToDate, string ClntID, string InvNo, string InvDate)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillPrintSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FrmDate);
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.NVarChar).Value = InvNo;
            cmd.Parameters.Add("@INVOICEDATE", SqlDbType.DateTime).Value = DateTime.Parse(InvDate);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        public DataTable SelectRegularBillHdrNo(string InvNo)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillHdrNoSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.NVarChar).Value = InvNo;             
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataSet SelectRegularBillId(string RgbId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillIdSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RGBID", SqlDbType.Int).Value = RgbId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertRegularBillHdr(string InvNo, string InvDate, string ClntID, string WrkDay, string FrmDate, string Todate, string AccYear, string PfPer, 
            string ESIPer, string BonPer, string GratPer, string LeavePer, string LTAPer, string OtherPer, string PfValue, string ESIValue, 
            string BonValue, string GratValue, string LeaveValue, string LTAValue, string LWFValue, string OtherValue, string TotSatuPer, 
            string TotSatuValue, string TotServPer, string TotServValue, string GrossTot, string GrandTot, string CGSTPer, string SGSTPer,
            string IGSTPer, string CessPer, string CGSTStatus, string SGSTStatus, string IGSTStatus, string CessStatus,
            string CGSTValue, string SGSTValue, string IGSTValue, string CessValue, string TotTax, string TotVal, string RoundUp,
            string Canteen, string Other, string NetAmount, string PFtatus, string ESIStatus, string BonusStatus, string GratuStatus,
            string LeaveStatus, string LTAStatus, string OtherStatus, string SreviceStatus)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillHdrInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.Int).Value = InvNo;
            cmd.Parameters.Add("@INVOICEDATE", SqlDbType.DateTime).Value = DateTime.Parse(InvDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@WORKINGDAYS", SqlDbType.Decimal).Value = WrkDay;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FrmDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(Todate);
            cmd.Parameters.Add("@ACCYEAR", SqlDbType.NVarChar).Value = AccYear;

            cmd.Parameters.Add("@PFPER", SqlDbType.Decimal).Value = PfPer;
            cmd.Parameters.Add("@ESIPER", SqlDbType.Decimal).Value = ESIPer;
            cmd.Parameters.Add("@BONUSPER", SqlDbType.Decimal).Value = BonPer;
            cmd.Parameters.Add("@GRATUITYPER", SqlDbType.Decimal).Value = GratPer;
            cmd.Parameters.Add("@LEAVEPER", SqlDbType.Decimal).Value = LeavePer;

            cmd.Parameters.Add("@LTAPER", SqlDbType.Decimal).Value = LTAPer;
            cmd.Parameters.Add("@OTHERPER", SqlDbType.Decimal).Value = OtherPer;

           
            cmd.Parameters.Add("@PFVALUE", SqlDbType.Decimal).Value = PfValue;
            cmd.Parameters.Add("@ESIVALUE", SqlDbType.Decimal).Value = ESIValue;
            cmd.Parameters.Add("@BONUSVALUE", SqlDbType.Decimal).Value = BonValue;
            cmd.Parameters.Add("@GRATUITYVALUE", SqlDbType.Decimal).Value = GratValue;
            cmd.Parameters.Add("@LEAVEVALUE", SqlDbType.Decimal).Value = LeaveValue;

            cmd.Parameters.Add("@LTAVALUE", SqlDbType.Decimal).Value = LTAValue;
            cmd.Parameters.Add("@LWFVALUE", SqlDbType.Decimal).Value = LWFValue;
            cmd.Parameters.Add("@OTHERVALUE", SqlDbType.Decimal).Value = OtherValue;

            cmd.Parameters.Add("@TOTALSATUTORYPER", SqlDbType.Decimal).Value = TotSatuPer;
            cmd.Parameters.Add("@TOTALSATUTORYVAL", SqlDbType.Decimal).Value = TotSatuValue;

            cmd.Parameters.Add("@SERVICEPER", SqlDbType.Decimal).Value = TotServPer;
            cmd.Parameters.Add("@SERVICEVALUE", SqlDbType.Decimal).Value = TotServValue;

            cmd.Parameters.Add("@GROSSWAGES", SqlDbType.Decimal).Value = GrossTot;
            cmd.Parameters.Add("@GRANDTOTAL", SqlDbType.Decimal).Value = GrandTot;
            cmd.Parameters.Add("@CGSTPER", SqlDbType.Decimal).Value = CGSTPer;
            cmd.Parameters.Add("@SGSTPER", SqlDbType.Decimal).Value = SGSTPer;
            cmd.Parameters.Add("@IGSTPER", SqlDbType.Decimal).Value = IGSTPer;
            cmd.Parameters.Add("@CESSPER", SqlDbType.Decimal).Value = CessPer;

            cmd.Parameters.Add("@CGSTSTATUS", SqlDbType.NVarChar).Value = CGSTStatus;
            cmd.Parameters.Add("@SGSTSTATUS", SqlDbType.NVarChar).Value = SGSTStatus;
            cmd.Parameters.Add("@IGSTSTATUS", SqlDbType.NVarChar).Value = IGSTStatus;
            cmd.Parameters.Add("@CESSSTATUS", SqlDbType.NVarChar).Value = CessStatus;

            cmd.Parameters.Add("@CGSTVALUE", SqlDbType.Decimal).Value = CGSTValue;
            cmd.Parameters.Add("@SGSTVALUE", SqlDbType.Decimal).Value = SGSTValue;
            cmd.Parameters.Add("@IGSTVALUE", SqlDbType.Decimal).Value = IGSTValue;
            cmd.Parameters.Add("@CESSVALUE", SqlDbType.Decimal).Value = CessValue;

            cmd.Parameters.Add("@TOTALTAX", SqlDbType.Decimal).Value = TotTax;
            cmd.Parameters.Add("@TOTALVALUE", SqlDbType.Decimal).Value = TotVal;
            cmd.Parameters.Add("@ROUNDUP", SqlDbType.Decimal).Value = RoundUp;
            cmd.Parameters.Add("@CANTEEN", SqlDbType.Decimal).Value = Canteen;
            cmd.Parameters.Add("@OTHER", SqlDbType.Decimal).Value = Other;

            cmd.Parameters.Add("@NETAMOUNT", SqlDbType.Decimal).Value = NetAmount;

            cmd.Parameters.Add("@PFSTATUS", SqlDbType.NVarChar).Value = PFtatus;
            cmd.Parameters.Add("@ESISTATUS", SqlDbType.NVarChar).Value = ESIStatus;
            cmd.Parameters.Add("@BONUSTATUS", SqlDbType.NVarChar).Value = BonusStatus;
            cmd.Parameters.Add("@GRATUISTATUS", SqlDbType.NVarChar).Value = GratuStatus;

            cmd.Parameters.Add("@LEAVESTATUS", SqlDbType.NVarChar).Value = LeaveStatus;
            cmd.Parameters.Add("@LTASTATUS", SqlDbType.NVarChar).Value = LTAStatus;
            cmd.Parameters.Add("@OTHESTATUS", SqlDbType.NVarChar).Value = OtherStatus;
            cmd.Parameters.Add("@SERVICESTATUS", SqlDbType.NVarChar).Value = SreviceStatus;


            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void UpdateRegularBillHdr(string RgbID, string InvNo, string InvDate, string ClntID, string WrkDay, string FrmDate, string Todate, string AccYear, string PfPer,
            string ESIPer, string BonPer, string GratPer, string LeavePer, string ServPer, string PfValue, string ESIValue, string BonValue, string GratValue, string LeaveValue, string ServValue,
            string TotServPer, string TotServValue, string TotIns, string GrossTot, string GrandTot, string CGSTPer, string SGSTPer, string IGSTPer, string CessPer,
            string CGSTValue, string SGSTValue, string IGSTValue, string CessValue, string NetAmount)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillHdrUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RGBID", SqlDbType.Int).Value = RgbID;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.Int).Value = InvNo;
            cmd.Parameters.Add("@INVOICEDATE", SqlDbType.DateTime).Value = DateTime.Parse(InvDate);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntID;
            cmd.Parameters.Add("@WORKINGDAYS", SqlDbType.Decimal).Value = WrkDay;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FrmDate);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(Todate);
            cmd.Parameters.Add("@ACCYEAR", SqlDbType.Decimal).Value = AccYear;
            cmd.Parameters.Add("@PFPER", SqlDbType.Decimal).Value = PfPer;
            cmd.Parameters.Add("@ESIPER", SqlDbType.Decimal).Value = ESIPer;
            cmd.Parameters.Add("@BONUSPER", SqlDbType.Decimal).Value = BonPer;
            cmd.Parameters.Add("@GRATUITYPER", SqlDbType.Decimal).Value = GratPer;
            cmd.Parameters.Add("@LEAVEPER", SqlDbType.Decimal).Value = LeavePer;
            cmd.Parameters.Add("@SERVICEPER", SqlDbType.Decimal).Value = ServPer;
            cmd.Parameters.Add("@PFVALUE", SqlDbType.Decimal).Value = PfValue;
            cmd.Parameters.Add("@ESIVALUE", SqlDbType.Decimal).Value = ESIValue;
            cmd.Parameters.Add("@BONUSVALUE", SqlDbType.Decimal).Value = BonValue;
            cmd.Parameters.Add("@GRATUITYVALUE", SqlDbType.Decimal).Value = GratValue;
            cmd.Parameters.Add("@LEAVEVALUE", SqlDbType.Decimal).Value = LeaveValue;
            cmd.Parameters.Add("@SERVICEVALUE", SqlDbType.Decimal).Value = ServValue;
            cmd.Parameters.Add("@TOTALSERVICEPER", SqlDbType.Decimal).Value = TotServPer;
            cmd.Parameters.Add("@TOTALSERVICEVAL", SqlDbType.Decimal).Value = TotServValue;
            cmd.Parameters.Add("@TOTALINCETIVE", SqlDbType.Decimal).Value = TotIns;
            cmd.Parameters.Add("@GROSSWAGES", SqlDbType.Decimal).Value = GrossTot;
            cmd.Parameters.Add("@GRANDTOTAL", SqlDbType.Decimal).Value = GrandTot;
            cmd.Parameters.Add("@CGSTPER", SqlDbType.Decimal).Value = CGSTPer;
            cmd.Parameters.Add("@SGSTPER", SqlDbType.Decimal).Value = SGSTPer;
            cmd.Parameters.Add("@IGSTPER", SqlDbType.Decimal).Value = IGSTPer;
            cmd.Parameters.Add("@CESSPER", SqlDbType.Decimal).Value = CessPer;
            cmd.Parameters.Add("@CGSTVALUE", SqlDbType.Decimal).Value = CGSTValue;
            cmd.Parameters.Add("@SGSTVALUE", SqlDbType.Decimal).Value = SGSTValue;
            cmd.Parameters.Add("@IGSTVALUE", SqlDbType.Decimal).Value = IGSTValue;
            cmd.Parameters.Add("@CESSVALUE", SqlDbType.Decimal).Value = CessValue;
            cmd.Parameters.Add("@NETAMOUNT", SqlDbType.Decimal).Value = NetAmount;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectRegularBillHdr()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillHdrSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectRegularBillDtl(string RgbID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillDtlSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RGBID", SqlDbType.Int).Value = RgbID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertRegularBillDtl(string RgbID, string EmpID, string EmpCode, string DptID, string DesdID, string WageType,
            string FixGrade, string WageDay, string EpfWageDay, string WrkDays, string ET1, string ET2, string ET3,
            string Basic, string Hra, string Convey, string Washing, string A1, string A2, string A3, string A4, string A5, string A6,
            string A7, string A8, string A9, string TotalWg, string OTAmount1, string OTAmount2, string OTAmount3, string TotExtra, string TotGross, string EpfWage, string Epf, string EsiWage,
            string Esi, string Advance, string D1, string D2, string D3, string D4, string D5, string D6, string D7, string D8,
            string TotDeduct, string Netwage)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillDtlInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RGBID", SqlDbType.Int).Value = RgbID;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.NVarChar).Value = EmpID;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = DptID;
            cmd.Parameters.Add("@DESIGNATIONID", SqlDbType.Decimal).Value = DesdID;
            cmd.Parameters.Add("@WAGETYPE", SqlDbType.NVarChar).Value = WageType;
            cmd.Parameters.Add("@FIXEDGRADE", SqlDbType.NVarChar).Value = FixGrade;
            cmd.Parameters.Add("@WAGEDAY", SqlDbType.NVarChar).Value = WageDay;
            cmd.Parameters.Add("@EPFWAGEDAY", SqlDbType.NVarChar).Value = EpfWageDay;
            cmd.Parameters.Add("@WORKDAYS", SqlDbType.NVarChar).Value = WrkDays;

            cmd.Parameters.Add("@ET1", SqlDbType.NVarChar).Value = ET1;
            cmd.Parameters.Add("@ET2", SqlDbType.NVarChar).Value = ET2;
            cmd.Parameters.Add("@ET3", SqlDbType.NVarChar).Value = ET3;


            cmd.Parameters.Add("@BASICDA", SqlDbType.NVarChar).Value = Basic;
            cmd.Parameters.Add("@HRA", SqlDbType.NVarChar).Value = Hra;
            cmd.Parameters.Add("@CONVEYANCE", SqlDbType.Decimal).Value = Convey;
            cmd.Parameters.Add("@WASHING", SqlDbType.NVarChar).Value = Washing;

            cmd.Parameters.Add("@A1", SqlDbType.NVarChar).Value = A1;
            cmd.Parameters.Add("@A2", SqlDbType.NVarChar).Value = A2;
            cmd.Parameters.Add("@A3", SqlDbType.NVarChar).Value = A3;
            cmd.Parameters.Add("@A4", SqlDbType.NVarChar).Value = A4;
            cmd.Parameters.Add("@A5", SqlDbType.NVarChar).Value = A5;
            cmd.Parameters.Add("@A6", SqlDbType.NVarChar).Value = A6;
            cmd.Parameters.Add("@A7", SqlDbType.NVarChar).Value = A7;
            cmd.Parameters.Add("@A8", SqlDbType.NVarChar).Value = A8;
            cmd.Parameters.Add("@A9", SqlDbType.NVarChar).Value = A9;

            cmd.Parameters.Add("@TOTALWAGE", SqlDbType.NVarChar).Value = TotalWg;

            cmd.Parameters.Add("@TOTALOTAMOUNT1", SqlDbType.NVarChar).Value = OTAmount1;
            cmd.Parameters.Add("@TOTALOTAMOUNT2", SqlDbType.NVarChar).Value = OTAmount2;
            cmd.Parameters.Add("@TOTALOTAMOUNT3", SqlDbType.NVarChar).Value = OTAmount3;

            cmd.Parameters.Add("@TOTALEXTRA", SqlDbType.NVarChar).Value = TotExtra;
            cmd.Parameters.Add("@TOTALGROSS", SqlDbType.NVarChar).Value = TotGross;
            cmd.Parameters.Add("@EPFWAGE", SqlDbType.Decimal).Value = EpfWage;
            cmd.Parameters.Add("@EPF", SqlDbType.NVarChar).Value = Epf;
            cmd.Parameters.Add("@ESIWAGE", SqlDbType.NVarChar).Value = EsiWage;
            cmd.Parameters.Add("@ESI", SqlDbType.NVarChar).Value = Esi;
            cmd.Parameters.Add("@ADVANCE", SqlDbType.NVarChar).Value = Advance;

            cmd.Parameters.Add("@D1", SqlDbType.NVarChar).Value = D1;
            cmd.Parameters.Add("@D2", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D3", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D4", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D5", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D6", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D7", SqlDbType.NVarChar).Value = D2;
            cmd.Parameters.Add("@D8", SqlDbType.NVarChar).Value = D2;

            cmd.Parameters.Add("@TOTALDEDUCTION", SqlDbType.NVarChar).Value = TotDeduct;
            cmd.Parameters.Add("@NETWAGE", SqlDbType.NVarChar).Value = Netwage;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteRegularBillDtl(string RgbID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillDtlDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RGBID", SqlDbType.Int).Value = RgbID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteRegularBillHdr(string RgbID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillHdrDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RGBID", SqlDbType.Int).Value = RgbID;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectRegularBillHdrMax()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("RegularBillHdrMaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure; 
                       
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public DataTable SelectPayrollMonthly(string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PayrollMonthlySelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        //--------- Report J
        public DataTable SelectMDAndETBreakUp(string FrmDt, string ToDt, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MDAndETBreakUpSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(ToDt);
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
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
            con.Close();
            con.Open();
            cmd = new SqlCommand("MDAndETBreakUpInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@DEPARTMENTID", SqlDbType.NVarChar).Value = DptID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClnID;

            cmd.Parameters.Add("@DAY1", SqlDbType.NVarChar).Value = Day1;
            cmd.Parameters.Add("@DAY2", SqlDbType.NVarChar).Value = Day2;
            cmd.Parameters.Add("@DAY3", SqlDbType.NVarChar).Value = Day3;
            cmd.Parameters.Add("@DAY4", SqlDbType.NVarChar).Value = Day4;
            cmd.Parameters.Add("@DAY5", SqlDbType.NVarChar).Value = Day5;
            cmd.Parameters.Add("@DAY6", SqlDbType.NVarChar).Value = Day6;
            cmd.Parameters.Add("@DAY7", SqlDbType.NVarChar).Value = Day7;
            cmd.Parameters.Add("@DAY8", SqlDbType.NVarChar).Value = Day8;
            cmd.Parameters.Add("@DAY9", SqlDbType.NVarChar).Value = Day9;
            cmd.Parameters.Add("@DAY10", SqlDbType.NVarChar).Value = Day10;
            cmd.Parameters.Add("@DAY11", SqlDbType.NVarChar).Value = Day11;
            cmd.Parameters.Add("@DAY12", SqlDbType.NVarChar).Value = Day12;
            cmd.Parameters.Add("@DAY13", SqlDbType.NVarChar).Value = Day13;
            cmd.Parameters.Add("@DAY14", SqlDbType.NVarChar).Value = Day14;
            cmd.Parameters.Add("@DAY15", SqlDbType.NVarChar).Value = Day15;
            cmd.Parameters.Add("@DAY16", SqlDbType.NVarChar).Value = Day16;
            cmd.Parameters.Add("@DAY17", SqlDbType.NVarChar).Value = Day17;
            cmd.Parameters.Add("@DAY18", SqlDbType.NVarChar).Value = Day18;
            cmd.Parameters.Add("@DAY19", SqlDbType.NVarChar).Value = Day19;
            cmd.Parameters.Add("@DAY20", SqlDbType.NVarChar).Value = Day20;
            cmd.Parameters.Add("@DAY21", SqlDbType.NVarChar).Value = Day21;
            cmd.Parameters.Add("@DAY22", SqlDbType.NVarChar).Value = Day22;
            cmd.Parameters.Add("@DAY23", SqlDbType.NVarChar).Value = Day23;
            cmd.Parameters.Add("@DAY24", SqlDbType.NVarChar).Value = Day24;
            cmd.Parameters.Add("@DAY25", SqlDbType.NVarChar).Value = Day25;
            cmd.Parameters.Add("@DAY26", SqlDbType.NVarChar).Value = Day26;
            cmd.Parameters.Add("@DAY27", SqlDbType.NVarChar).Value = Day27;
            cmd.Parameters.Add("@DAY28", SqlDbType.NVarChar).Value = Day28;
            cmd.Parameters.Add("@DAY29", SqlDbType.NVarChar).Value = Day29;
            cmd.Parameters.Add("@DAY30", SqlDbType.NVarChar).Value = Day30;
            cmd.Parameters.Add("@DAY31", SqlDbType.NVarChar).Value = Day31;

            cmd.Parameters.Add("@OT1", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot1).ToString("0.00");
            cmd.Parameters.Add("@OT2", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot2).ToString("0.00");
            cmd.Parameters.Add("@OT3", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot3).ToString("0.00");
            cmd.Parameters.Add("@OT4", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot4).ToString("0.00");
            cmd.Parameters.Add("@OT5", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot5).ToString("0.00");
            cmd.Parameters.Add("@OT6", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot6).ToString("0.00");
            cmd.Parameters.Add("@OT7", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot7).ToString("0.00");
            cmd.Parameters.Add("@OT8", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot8).ToString("0.00");
            cmd.Parameters.Add("@OT9", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot9).ToString("0.00");
            cmd.Parameters.Add("@OT10", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot10).ToString("0.00");
            cmd.Parameters.Add("@OT11", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot11).ToString("0.00");
            cmd.Parameters.Add("@OT12", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot12).ToString("0.00");
            cmd.Parameters.Add("@OT13", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot13).ToString("0.00");
            cmd.Parameters.Add("@OT14", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot14).ToString("0.00");
            cmd.Parameters.Add("@OT15", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot15).ToString("0.00");
            cmd.Parameters.Add("@OT16", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot16).ToString("0.00");
            cmd.Parameters.Add("@OT17", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot17).ToString("0.00");
            cmd.Parameters.Add("@OT18", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot18).ToString("0.00");
            cmd.Parameters.Add("@OT19", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot19).ToString("0.00");
            cmd.Parameters.Add("@OT20", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot20).ToString("0.00");
            cmd.Parameters.Add("@OT21", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot21).ToString("0.00");
            cmd.Parameters.Add("@OT22", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot22).ToString("0.00");
            cmd.Parameters.Add("@OT23", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot23).ToString("0.00");
            cmd.Parameters.Add("@OT24", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot24).ToString("0.00");
            cmd.Parameters.Add("@OT25", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot25).ToString("0.00");
            cmd.Parameters.Add("@OT26", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot26).ToString("0.00");
            cmd.Parameters.Add("@OT27", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot27).ToString("0.00");
            cmd.Parameters.Add("@OT28", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot28).ToString("0.00");
            cmd.Parameters.Add("@OT29", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot29).ToString("0.00");
            cmd.Parameters.Add("@OT30", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot30).ToString("0.00");
            cmd.Parameters.Add("@OT31", SqlDbType.Decimal).Value = Convert.ToDecimal(Ot31).ToString("0.00");

            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = DateTime.Parse(FrmDt);
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = DateTime.Parse(ToDt);
            cmd.Parameters.Add("@Flag", SqlDbType.NVarChar).Value = Flag;

            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = TotPre;
            cmd.Parameters.Add("@TOTALOT", SqlDbType.Decimal).Value = TotOT;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataSet SelectReport26For(string FrmDt, string ToDt, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("Report26ForSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = FrmDt;
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = ToDt;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        public DataSet ReportJforSelect(string FrmDt, string ToDt, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ReportJforSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = FrmDt;
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = ToDt;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        public DataSet SelectMonthlyPaySlip(string FrmDt, string ToDt, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPaySlip", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = FrmDt;
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = ToDt;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        public DataSet SelectMonthlyPayrollForReportJ(string FrmDt, string ToDt, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("MonthlyPayrollForReportJSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = FrmDt;
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = ToDt;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }


        public DataTable SelectESIEstablishment(string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIEstablishmentSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        // PF Generate

        public DataTable PFGenerateSelect(string Month, string Year, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PFGenerateSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            cmd.Parameters.Add("@Month", SqlDbType.NVarChar).Value = Month;
            cmd.Parameters.Add("@Year", SqlDbType.NVarChar).Value = Year;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable PFGenerateSelectAll(string Month, string Year)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PFGenerateSelectAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
          
            cmd.Parameters.Add("@Month", SqlDbType.NVarChar).Value = Month;
            cmd.Parameters.Add("@Year", SqlDbType.NVarChar).Value = Year;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public DataTable PFGenerateSelectAllForJ(string Month, string Year)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PFGenerateSelectAllForJ", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Month", SqlDbType.NVarChar).Value = Month;
            cmd.Parameters.Add("@Year", SqlDbType.NVarChar).Value = Year;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertPfGenerateHdr(string PfMonth, string PfDate, string Types, string PreStrength, string MemAddition,
            string MemDeletion, string CurStrength, string ActStrength)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateHdrInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PFMONTH", SqlDbType.NVarChar).Value = PfMonth;
            cmd.Parameters.Add("@PFDATE", SqlDbType.NVarChar).Value = PfDate;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            cmd.Parameters.Add("@PRESTRENGTH", SqlDbType.NVarChar).Value = PreStrength;
            cmd.Parameters.Add("@MEMADDITION", SqlDbType.NVarChar).Value = MemAddition;
            cmd.Parameters.Add("@MEMDELETION", SqlDbType.NVarChar).Value = MemDeletion;
            cmd.Parameters.Add("@CURRSTRENGTH", SqlDbType.NVarChar).Value = CurStrength;
            cmd.Parameters.Add("@TOTACTSTRENGTH", SqlDbType.NVarChar).Value = ActStrength;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable PfGenerateHdrMaxSelect()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateHdrMaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public void InsertPfGenerateDtl(string PfId, string EmpId, string EmpCode, string ClntId, string NCPDay, string PFWage,
    string AC0, string AC1, string AC2, string AC10, string AC21, string AC22, string EmpShar, string Total)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateDtlInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PFGID", SqlDbType.NVarChar).Value = PfId;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.NVarChar).Value = EmpId;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntId;
            cmd.Parameters.Add("@TOTALEPFWAGE", SqlDbType.NVarChar).Value = PFWage;
            cmd.Parameters.Add("@NCPDAYS", SqlDbType.NVarChar).Value = NCPDay;
            cmd.Parameters.Add("@AC0", SqlDbType.NVarChar).Value = AC0;
            cmd.Parameters.Add("@AC1", SqlDbType.NVarChar).Value = AC1;
            cmd.Parameters.Add("@AC2", SqlDbType.NVarChar).Value = AC2;
            cmd.Parameters.Add("@AC10", SqlDbType.NVarChar).Value = AC10;
            cmd.Parameters.Add("@AC21", SqlDbType.NVarChar).Value = AC21;
            cmd.Parameters.Add("@AC22", SqlDbType.NVarChar).Value = AC22;
            cmd.Parameters.Add("@EMPSHARE", SqlDbType.NVarChar).Value = EmpShar;
            cmd.Parameters.Add("@TOTAL", SqlDbType.NVarChar).Value = Total;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable PfGenerateBKGridshow()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateHdrSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public void UpdatePfGenerateHdr(string PfId, string PfMonth, string PfDate, string Types, string PreStrength, string MemAddition,
            string MemDeletion, string CurStrength, string ActStrength)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateHdrUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PFGID", SqlDbType.NVarChar).Value = PfId;
            cmd.Parameters.Add("@PFMONTH", SqlDbType.NVarChar).Value = PfMonth;
            cmd.Parameters.Add("@PFDATE", SqlDbType.NVarChar).Value = PfDate;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            cmd.Parameters.Add("@PRESTRENGTH", SqlDbType.NVarChar).Value = PreStrength;
            cmd.Parameters.Add("@MEMADDITION", SqlDbType.NVarChar).Value = MemAddition;
            cmd.Parameters.Add("@MEMDELETION", SqlDbType.NVarChar).Value = MemDeletion;
            cmd.Parameters.Add("@CURRSTRENGTH", SqlDbType.NVarChar).Value = CurStrength;
            cmd.Parameters.Add("@TOTACTSTRENGTH", SqlDbType.NVarChar).Value = ActStrength;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeletePfGenerateHdr(string PfId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateHdrDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PFGID", SqlDbType.NVarChar).Value = PfId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectPfGenerateDtl(string PFID)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PfGenerateDtlSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@PFGID", SqlDbType.NVarChar).Value = PFID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        // PF Master

        public void PFMasterInsertDC(string PFNAME, string EPFContAC1, string EPSContAC10, string DiffBetEPFEPSAC1, string EDLIContAC21, string EPFChargeAC2, string EDLIChargeAC22, string RefundAC1, string Total)
        {
            con.Close();
            con.Open();

            cmd = new SqlCommand("PFMasterInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@PFNAME", SqlDbType.NVarChar).Value = PFNAME;
            cmd.Parameters.Add("@PFEMPLOYEESEPF", SqlDbType.Decimal).Value =EPFContAC1;
            cmd.Parameters.Add("@PFEMPLOYERSEPF", SqlDbType.Decimal).Value = EPSContAC10;
            cmd.Parameters.Add("@PFEMPLOYERSEPS", SqlDbType.Decimal).Value = DiffBetEPFEPSAC1;
            cmd.Parameters.Add("@ADMINCHARGES", SqlDbType.Decimal).Value = EDLIContAC21;
            cmd.Parameters.Add("@PFACCOUNT", SqlDbType.Decimal).Value = EPFChargeAC2;
            cmd.Parameters.Add("@EDLI", SqlDbType.Decimal).Value = EDLIChargeAC22;
            cmd.Parameters.Add("@REFUND", SqlDbType.Decimal).Value = RefundAC1;
            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = Total;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void PFMasterUpdateDC(string PFID, string PFNAME, string EPFContAC1, string EPSContAC10, string DiffBetEPFEPSAC1, string EDLIContAC21, string EPFChargeAC2, string EDLIChargeAC22, string RefundAC1, string Total)
        {
            con.Close();
            con.Open();

            cmd = new SqlCommand("PFMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@PFID", SqlDbType.NVarChar).Value = PFID;
            cmd.Parameters.Add("@PFNAME", SqlDbType.NVarChar).Value = PFNAME;
            cmd.Parameters.Add("@PFEMPLOYEESEPF", SqlDbType.Decimal).Value = EPFContAC1;
            cmd.Parameters.Add("@PFEMPLOYERSEPF", SqlDbType.Decimal).Value = EPSContAC10;
            cmd.Parameters.Add("@PFEMPLOYERSEPS", SqlDbType.Decimal).Value = DiffBetEPFEPSAC1;
            cmd.Parameters.Add("@ADMINCHARGES", SqlDbType.Decimal).Value = EDLIContAC21;
            cmd.Parameters.Add("@PFACCOUNT", SqlDbType.Decimal).Value = EPFChargeAC2;
            cmd.Parameters.Add("@EDLI", SqlDbType.Decimal).Value = EDLIChargeAC22;
            cmd.Parameters.Add("@REFUND", SqlDbType.Decimal).Value = RefundAC1;
            cmd.Parameters.Add("@TOTAL", SqlDbType.Decimal).Value = Total;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable PFMasterGridviewShowDC()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("PFMasterGridviewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        // ESI Generate

        public DataTable SelectESIGenerate(string Month, string Year)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateSelectAll", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Month", SqlDbType.NVarChar).Value = Month;
            cmd.Parameters.Add("@Year", SqlDbType.NVarChar).Value = Year;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

        public void InsertESIGenerateHdr(string ESIMonth, string ESIDate, string Types, string PreStrength, string MemAddition,
            string MemDeletion, string CurStrength, string ActStrength)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateHdrInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ESIMONTH", SqlDbType.NVarChar).Value = ESIMonth;
            cmd.Parameters.Add("@ESIDATE", SqlDbType.NVarChar).Value = ESIDate;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            cmd.Parameters.Add("@PRESTRENGTH", SqlDbType.NVarChar).Value = PreStrength;
            cmd.Parameters.Add("@MEMADDITION", SqlDbType.NVarChar).Value = MemAddition;
            cmd.Parameters.Add("@MEMDELETION", SqlDbType.NVarChar).Value = MemDeletion;
            cmd.Parameters.Add("@CURRSTRENGTH", SqlDbType.NVarChar).Value = CurStrength;
            cmd.Parameters.Add("@TOTACTSTRENGTH", SqlDbType.NVarChar).Value = ActStrength;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectESIGenerateHdrMax()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateHdrMaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }


        public void InsertESIGenerateDtl(string ESIId, string EmpId, string EmpCode, string ESIWage, string WrkDay,
                     string ClntId, string Employee, string Employer, string Total)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateDtlInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ESIGID", SqlDbType.NVarChar).Value = ESIId;
            cmd.Parameters.Add("@EMPLOYEEID", SqlDbType.NVarChar).Value = EmpId;
            cmd.Parameters.Add("@EMPLOYEECODE", SqlDbType.NVarChar).Value = EmpCode;
            cmd.Parameters.Add("@ESIWAGE", SqlDbType.NVarChar).Value = ESIWage;
            cmd.Parameters.Add("@WORKED", SqlDbType.NVarChar).Value = WrkDay;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.NVarChar).Value = ClntId;
            cmd.Parameters.Add("@ESIEMPLOYEES", SqlDbType.NVarChar).Value = Employee;
            cmd.Parameters.Add("@ESIEMPLOYERS", SqlDbType.NVarChar).Value = Employer;
            cmd.Parameters.Add("@TOTAL", SqlDbType.NVarChar).Value = Total;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }


        public DataTable ESIGenerateGridshowBS()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateHdrSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        public void UpdateESIGenerateHdr(string ESIId, string ESIMonth, string ESIDate, string Types, string PreStrength, string MemAddition,
            string MemDeletion, string CurStrength, string ActStrength)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateHdrUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ESIGID", SqlDbType.NVarChar).Value = ESIId;
            cmd.Parameters.Add("@ESIMONTH", SqlDbType.NVarChar).Value = ESIMonth;
            cmd.Parameters.Add("@ESIDATE", SqlDbType.NVarChar).Value = ESIDate;
            cmd.Parameters.Add("@TYPE", SqlDbType.NVarChar).Value = Types;
            cmd.Parameters.Add("@PRESTRENGTH", SqlDbType.NVarChar).Value = PreStrength;
            cmd.Parameters.Add("@MEMADDITION", SqlDbType.NVarChar).Value = MemAddition;
            cmd.Parameters.Add("@MEMDELETION", SqlDbType.NVarChar).Value = MemDeletion;
            cmd.Parameters.Add("@CURRSTRENGTH", SqlDbType.NVarChar).Value = CurStrength;
            cmd.Parameters.Add("@TOTACTSTRENGTH", SqlDbType.NVarChar).Value = ActStrength;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void DeleteESIGenerateDtl(string ESIId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateDtlDelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ESIGID", SqlDbType.NVarChar).Value = ESIId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable SelectESIGenerateDtl(string ESIId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIGenerateDtlSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ESIGID", SqlDbType.NVarChar).Value = ESIId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        // ESI Master


        //public void ESIMasterInsertDC(string ESINAME, string ESIEmployeeContribution, string ESIEmployerContribution)
        //{
        //    con.Close();
        //    con.Open();

        //    cmd = new SqlCommand("ESIMasterInsert", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    cmd.Parameters.Add("@ESINAME", SqlDbType.NVarChar).Value = ESINAME;
        //    cmd.Parameters.Add("@ESIEMPLOYEES", SqlDbType.Decimal).Value = ESIEmployeeContribution;
        //    cmd.Parameters.Add("@ESIEMPLOYERS", SqlDbType.Decimal).Value = ESIEmployerContribution;

        //    int i = cmd.ExecuteNonQuery();
        //    if (i > 0)
        //    {

        //    }
        //    con.Close();
        //}

        public void ESIMasterUpdateDC(string ESIID, string ESINAME, string ESIEmployeeContribution, string ESIEmployerContribution)
        {
            con.Close();
            con.Open();

            cmd = new SqlCommand("ESIMasterUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ESIID", SqlDbType.Int).Value = ESIID;
            cmd.Parameters.Add("@ESINAME", SqlDbType.NVarChar).Value = ESINAME;
            cmd.Parameters.Add("@ESIEMPLOYEES", SqlDbType.Decimal).Value = ESIEmployeeContribution;
            cmd.Parameters.Add("@ESIEMPLOYERS", SqlDbType.Decimal).Value = ESIEmployerContribution;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable ESIMasterGridviewShowDC()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("ESIMasterGridviewSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        // GST Details


        //public DataTable GSTTaxFrontGridShowDC(string FromDate, string ToDate)
        //{
        //    con.Close();
        //    con.Open();
        //    cmd = new SqlCommand("GSTTaxSelect", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = DateTime.Parse(FromDate);
        //    cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = DateTime.Parse(ToDate);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    con.Close();
        //    return dt;
        //}

        public DataTable SelectGSTTax(string FromDate)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GSTTaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FromDate", SqlDbType.NVarChar).Value =FromDate;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        public void GSTDetailsInsertDC(string GSTMonthID, string GSTMonth, string ChallanDate, string CodeNo, string PaymentMode, string BankName,
            string BranchName, string PreparedBy, string PaymentDate, string CGST, string IGST, string CESS, string SGST, 
            string TotalGST, string PurchaseValue, string TotalPayabelGSTValue, string GSTPaymentStatus, string CIPNNo)
        {
            con.Close();
            con.Open();

            cmd = new SqlCommand("GSTDetailsInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            

            cmd.Parameters.Add("@GSTMONTHID", SqlDbType.Int).Value = GSTMonthID;
            cmd.Parameters.Add("@GSTMONTH", SqlDbType.NVarChar).Value = GSTMonth;

            cmd.Parameters.Add("@CHALLANDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ChallanDate);
            cmd.Parameters.Add("@CODENO", SqlDbType.NVarChar).Value = CodeNo;
            cmd.Parameters.Add("@PAYMENTMODE", SqlDbType.NVarChar).Value = PaymentMode;
            cmd.Parameters.Add("@BANKNAME", SqlDbType.NVarChar).Value = BankName;
            cmd.Parameters.Add("@BRANCHNAME", SqlDbType.NVarChar).Value = BranchName;
            cmd.Parameters.Add("@PREPAREDBY", SqlDbType.NVarChar).Value = PreparedBy;
            cmd.Parameters.Add("@PAYMENTDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PaymentDate);
            cmd.Parameters.Add("@CGST", SqlDbType.Decimal).Value = CGST;
            cmd.Parameters.Add("@IGST", SqlDbType.Decimal).Value = IGST;
            cmd.Parameters.Add("@CESS", SqlDbType.Decimal).Value = CESS;
            cmd.Parameters.Add("@SGST", SqlDbType.Decimal).Value = SGST;
            cmd.Parameters.Add("@TOTALGST", SqlDbType.Decimal).Value = TotalGST;
            cmd.Parameters.Add("@PURCHASEVALUE", SqlDbType.Decimal).Value = PurchaseValue;
            cmd.Parameters.Add("@TOTALPAYABELGSTVALUE", SqlDbType.Decimal).Value = TotalPayabelGSTValue;
            cmd.Parameters.Add("@GSTPAYMENTSTATUS", SqlDbType.NVarChar).Value = GSTPaymentStatus;
            cmd.Parameters.Add("@CIPNNO", SqlDbType.NVarChar).Value = CIPNNo;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable GSTDetailsGridShowDC()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GSTDetailsGridShow", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public void GSTDetailsUpdateDC(string GSTID, string GSTMonthID, string GSTMonth, string ChallanDate, string CodeNo, string PaymentMode, string BankName,
            string BranchName, string PreparedBy, string PaymentDate, string CGST, string IGST, string CESS, string SGST,
            string TotalGST, string PurchaseValue, string TotalPayabelGSTValue, string GSTPaymentStatus, string CIPNNo)
        {
            con.Close();
            con.Open();

            cmd = new SqlCommand("GSTDetailsUpdate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@GSTID", SqlDbType.Int).Value = GSTID;

            cmd.Parameters.Add("@GSTMONTHID", SqlDbType.Int).Value = GSTMonthID; 
            cmd.Parameters.Add("@GSTMONTH", SqlDbType.NVarChar).Value = GSTMonth;

            cmd.Parameters.Add("@CHALLANDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(ChallanDate);
            cmd.Parameters.Add("@CODENO", SqlDbType.NVarChar).Value = CodeNo;
            cmd.Parameters.Add("@PAYMENTMODE", SqlDbType.NVarChar).Value = PaymentMode;
            cmd.Parameters.Add("@BANKNAME", SqlDbType.NVarChar).Value = BankName;
            cmd.Parameters.Add("@BRANCHNAME", SqlDbType.NVarChar).Value = BranchName;
            cmd.Parameters.Add("@PREPAREDBY", SqlDbType.NVarChar).Value = PreparedBy;
            cmd.Parameters.Add("@PAYMENTDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(PaymentDate);
            cmd.Parameters.Add("@CGST", SqlDbType.Decimal).Value = CGST;
            cmd.Parameters.Add("@IGST", SqlDbType.Decimal).Value = IGST;
            cmd.Parameters.Add("@CESS", SqlDbType.Decimal).Value = CESS;
            cmd.Parameters.Add("@SGST", SqlDbType.Decimal).Value = SGST;
            cmd.Parameters.Add("@TOTALGST", SqlDbType.Decimal).Value = TotalGST;
            cmd.Parameters.Add("@PURCHASEVALUE", SqlDbType.Decimal).Value = PurchaseValue;
            cmd.Parameters.Add("@TOTALPAYABELGSTVALUE", SqlDbType.Decimal).Value = TotalPayabelGSTValue;
            cmd.Parameters.Add("@GSTPAYMENTSTATUS", SqlDbType.NVarChar).Value = GSTPaymentStatus;
            cmd.Parameters.Add("@CIPNNO", SqlDbType.NVarChar).Value = CIPNNo;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public void GSTInvoiceDetailsInsertDC(string GSTID, string CLIENTID, string RGBID, string InvoiceNo, string InvoiceDate, string ClientName, string ClientGSTNo, 
           string Division, string InvoiceGrandTotal, string CGSTValue, string SGSTValue, string IGSTValue, string CESSValue, string TotalGSTAmount)
        {
            con.Close();
            con.Open();

            cmd = new SqlCommand("GSTInvoiceDetailsInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@GSTID", SqlDbType.NVarChar).Value = GSTID;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = CLIENTID;
            cmd.Parameters.Add("@RGBID", SqlDbType.NVarChar).Value = RGBID;
            cmd.Parameters.Add("@INVOICENO", SqlDbType.NVarChar).Value = InvoiceNo;
            cmd.Parameters.Add("@INVOICEDATE", SqlDbType.DateTime).Value = Convert.ToDateTime(InvoiceDate);
            cmd.Parameters.Add("@CLIENTNAME", SqlDbType.NVarChar).Value = ClientName;
            cmd.Parameters.Add("@CLIENTGSTNO", SqlDbType.NVarChar).Value = ClientGSTNo;
            cmd.Parameters.Add("@DIVISION", SqlDbType.NVarChar).Value = Division;
            cmd.Parameters.Add("@INVOICEGRANDTOTAL", SqlDbType.Decimal).Value = InvoiceGrandTotal;
            cmd.Parameters.Add("@CGSTVALUE", SqlDbType.Decimal).Value = CGSTValue;
            cmd.Parameters.Add("@SGSTVALUE", SqlDbType.Decimal).Value = SGSTValue;
            cmd.Parameters.Add("@IGSTVALUE", SqlDbType.Decimal).Value = IGSTValue;
            cmd.Parameters.Add("@CESSVALUE", SqlDbType.Decimal).Value = CESSValue;
            cmd.Parameters.Add("@TOTALGSTAMOUNT", SqlDbType.Decimal).Value = TotalGSTAmount;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable GSTDetailsHdrMaxSelect()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GSTDetailsHdrMaxSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        public DataTable GSTCodeNoDC()
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GSTCodeNo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);            
            con.Close();
            return dt;
        }

        public void DeleteGStIdDC (string GSTId)
        {
            con.Close();
            cmd = new SqlCommand("GSTDeleteId", con);
            cmd.Parameters.Add("@GSTID", SqlDbType.VarChar).Value = GSTId;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

            }
            con.Close();
        }

        public DataTable GSTDetailsDtlGridShowDC(string GSTId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("GSTDetailsDtlGridshow", con);
            cmd.Parameters.Add("@GSTID", SqlDbType.VarChar).Value = GSTId;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }


        // Forms-25 Reports

        public DataSet Attendance12and25ForReportJSelect(string Fromdate, string Todate, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("Attendance12and25ForReportJSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Fromdate;
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Todate;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

        // Forms-B Reports

        public DataSet FormBReportSelect(string Fromdate, string Todate, string ClntId)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand("FormBReportSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FROMDATE", SqlDbType.DateTime).Value = Fromdate;
            cmd.Parameters.Add("@TODATE", SqlDbType.DateTime).Value = Todate;
            cmd.Parameters.Add("@CLIENTID", SqlDbType.Int).Value = ClntId;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
            con.Close();
        }

    }
}
