<%@ Application Language="VB" %>

<script RunAt="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Dim conn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OSS").ConnectionString
        Dim dict As DevExpress.Xpo.Metadata.XPDictionary = New DevExpress.Xpo.Metadata.ReflectionDictionary()
        
        dict.GetDataStoreSchema( _
                            GetType(Bisnisobjek.OSS.Propinsi).Assembly, _
                            GetType(Bisnisobjek.OSS.Kabupaten).Assembly, _
                            GetType(Bisnisobjek.OSS.Kecamatan).Assembly, _
                            GetType(Bisnisobjek.OSS.Kelurahan).Assembly, _
                            GetType(Bisnisobjek.OSS.JenisIzin).Assembly, _
                            GetType(Bisnisobjek.OSS.MasterDataJenisPermohonan).Assembly, _
                            GetType(Bisnisobjek.OSS.JenisPermohonanIzin).Assembly, _
                            GetType(Bisnisobjek.OSS.MasterDataSyarat).Assembly, _
                            GetType(Bisnisobjek.OSS.SyaratIzin).Assembly, _
                            GetType(Bisnisobjek.OSS.Lokasi).Assembly, _
                            GetType(Bisnisobjek.OSS.tanah).Assembly, _
                            GetType(Bisnisobjek.OSS.sertifikat).Assembly, _
                            GetType(Bisnisobjek.OSS.Penandatanganan).Assembly, _
                            GetType(Bisnisobjek.OSS.IMB).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBbahan).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBRetribusiDetails).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBbangunan).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBpelaksana).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBRetribusi).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBtipeHitung).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBtujuan).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBpelaksana).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBlantai).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBPemeriksaan).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBPemeriksaanDetail).Assembly, _
                            GetType(Bisnisobjek.OSS.IMBBAP).Assembly, _
                            GetType(Bisnisobjek.OSS.TDP).Assembly, _
                            GetType(Bisnisobjek.OSS.IUI).Assembly, _
                            GetType(Bisnisobjek.OSS.IUIPemeriksaan).Assembly, _
                            GetType(Bisnisobjek.OSS.IUIPemeriksaanDetail).Assembly, _
                            GetType(Bisnisobjek.OSS.Permohonan).Assembly, _
                            GetType(Bisnisobjek.OSS.Rekening).Assembly)
         
        DevExpress.Xpo.XpoDefault.Session = Nothing
        
        Dim store As DevExpress.Xpo.DB.IDataStore = DevExpress.Xpo.XpoDefault.GetConnectionProvider(conn, DevExpress.Xpo.DB.AutoCreateOption.SchemaAlreadyExists)
        DevExpress.Xpo.XpoDefault.DataLayer = New DevExpress.Xpo.ThreadSafeDataLayer(dict, store)
        
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>

