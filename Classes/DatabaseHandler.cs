using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MalayanEventHub.Classes
{
    //class for handling the database
    public class DatabaseHandler
    {
        private SqlConnection dbConn;
        private bool isValidRequest;
        public DatabaseHandler()
        {
            try
            {
                dbConn = new SqlConnection("Server = tcp:mcleventhub.database.windows.net, 1433; Initial Catalog = MalayanEventHubDB; Persist Security Info = False; User ID = group2; Password = !Malayaneventhub1234; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;");
                isValidRequest = true;
            }
            catch (Exception ex)
            {
                isValidRequest = false;
                throw ex;
            }

        }

      #region Inserting,Updating,Deleting Query
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

        internal void ExecuteUpdateQuery(SqlCommand dbCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }

            //execute query
            dbConn.Open();
            dbCMD.Connection = dbConn;
            dbCMD.ExecuteNonQuery();
            

            //close db connection
            dbConn.Close();
        }

        internal string ExecuteUpdateQueryInReturn(SqlCommand dbCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }

            //execute query
            dbConn.Open();
            dbCMD.Connection = dbConn;
            if (dbCMD.CommandText[dbCMD.CommandText.Length - 1] != ';')
            {
                dbCMD.CommandText += ";";
            }
            dbCMD.CommandText += "SELECT SCOPE_IDENTITY()";
            string lastID = dbCMD.ExecuteScalar().ToString();

            //close db connection
            dbConn.Close();

            return lastID;
        }
        internal string ExecuteUpdateQueryInReturn(string queryCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }

            //execute query
            dbConn.Open();
            SqlCommand dbCMD = new SqlCommand(queryCMD, dbConn);
            if (dbCMD.CommandText[dbCMD.CommandText.Length - 1] != ';')
            {
                dbCMD.CommandText += ";";
            }
            dbCMD.CommandText += "SELECT SCOPE_IDENTITY()";
            string lastId =  dbCMD.ExecuteScalar().ToString();


            //close db connection
            dbConn.Close();

            return lastId;
        }

        internal void ExecuteInsertQuery(string queryCMD)
        {
            ExecuteUpdateQuery(queryCMD);

         
        }

        internal void ExecuteInsertQuery(SqlCommand dbCMD)
        {
            ExecuteUpdateQuery(dbCMD);
        }
        internal string ExecuteInsertQueryInReturn(string queryCMD)
        {
            return ExecuteUpdateQueryInReturn(queryCMD);

         
        }

        internal string ExecuteInsertQueryInReturn(SqlCommand dbCMD)
        {
            
            return ExecuteUpdateQueryInReturn(dbCMD); 
        }


      
        #endregion
        
        // for retrieving data
        internal List<Dictionary<string, string>> RetrieveData(string queryCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }
            //Initializing a data list
            List<Dictionary<string, string>> dataList = new List<Dictionary<string, string>>();

            //execute query
            dbConn.Open();
            SqlCommand dbCMD = new SqlCommand(queryCMD, dbConn);
            SqlDataReader dataReader = dbCMD.ExecuteReader();
            //iterate every record
            while(dataReader.Read())
            {
                //make new dictionary
                Dictionary<string, string> dict = new Dictionary<string, string>();
                //get fieldname and value
                //store it to a dictionary
                for(int i=0; i<dataReader.FieldCount; i++)
                {
                    string fieldName = dataReader.GetName(i);
                    string value = dataReader[fieldName].ToString();

                    dict[fieldName] = value;
                }

                //add to list
                dataList.Add(dict);
            }

            //close db connection
            dbConn.Close();


            //return datalist
            return dataList;
        }

        internal bool GetRequestStatus()
        {
            return isValidRequest;
        }
    }
}