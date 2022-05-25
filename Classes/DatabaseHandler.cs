using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace MCLEventHub.Classes
{
    //class for handling the database
    public class DatabaseHandler
    {
        private SqlConnection dbConn;
        private bool isValidRequest;
        public DatabaseHandler(string dbNameServerPath)
        {
            try
            {
                dbConn = new SqlConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + dbNameServerPath);
                isValidRequest = true;
            }
            catch (Exception ex)
            {
                isValidRequest = false;
                throw ex;
            }

        }

        internal void ExecuteUpdateQuery(string queryCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }

            //execute query
            dbConn.Open();
            SqlCommand dbCMD = new SqlCommand(queryCMD, dbConn);
            dbCMD.ExecuteNonQuery();
            //close db connection
            dbConn.Close();
        }

        //internal List<Dictionary<string, string>> RetrieveData(string queryCMD)
        //{
        //    if (!isValidRequest)
        //    {
        //        throw new Exception("Error Initializing Sql Connection Object.");
        //    }
        //    //Initializing a data list
        //    List<Dictionary<string, string>> dataList = new List<Dictionary<string, string>>();

        //    //execute query
        //    dbConn.Open();
        //    SqlCommand dbCMD = new SqlCommand(queryCMD, dbConn);
        //    SqlDataReader sqlData = dbCMD.ExecuteReader();

        //    //save it to another data structure
        //    DataTable dt = new DataTable(sqlData);
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        Dictionary<string, string> dict = new Dictionary<string, string>();
        //        foreach (DataColumn column in dt.Columns)
        //        {

        //            dict[column.ColumnName] = row[column];
        //        }

        //        //add to list
        //        dataList.Add(dict);
        //    }

        //    //close db connection
        //    dbConn.Close();


        //    //return datalist
        //    return dataList;
        //}

        internal bool GetRequestStatus()
        {
            return isValidRequest;
        }
    }
}