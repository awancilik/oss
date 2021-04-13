Imports Microsoft.VisualBasic
Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared

Public MustInherit Class ReportPageBase
    Inherits System.Web.UI.Page

    <Serializable()> _
    Public MustInherit Class ParametersBase(Of T As ParametersBase(Of T))

        Protected MustOverride ReadOnly Property ParameterNames() As String()

        Protected Function HasMissingParameters() As Boolean
            For Each param As String In ParameterNames
                If HttpContext.Current.Request.QueryString.Item(param) Is Nothing Then
                    Return True
                End If
            Next
            Return False
        End Function

        Protected MustOverride Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean

        Protected MustOverride Function CreateQueryStringValue(ByVal parameter As String) As String

        Protected MustOverride ReadOnly Property PageFileName() As String

        Private Function ParseQueryString() As Boolean
            For Each param As String In ParameterNames
                Dim value As String = HttpContext.Current.Request.QueryString(param)
                If Not ParseParameterValue(param, value) Then
                    Return False
                End If
            Next
            Return True
        End Function

        Public Shared Function Parse() As T
            Dim obj As T = DirectCast(Activator.CreateInstance(GetType(T), True), T)
            With obj
                If Not obj.HasMissingParameters Then
                    If obj.ParseQueryString Then
                        Return obj
                    End If
                End If
            End With
            Return Nothing
        End Function

        Public Function Url() As String
            'Format ke dalam bentuk query string
            Dim result As String = PageFileName
            If (result.IndexOf("?") = -1) Then
                result += "?"
            Else
                result += "&"
            End If

            Dim firstOne As Boolean = True
            For Each param As String In ParameterNames
                If firstOne Then
                    firstOne = False
                Else
                    result += "&"
                End If
                result += String.Concat(HttpContext.Current.Server.UrlEncode(param), "=", HttpContext.Current.Server.UrlEncode(CreateQueryStringValue(param)))
            Next

            Return result
        End Function

        Public Sub OpenReportInNewWindow()
            HttpContext.Current.Response.Write(String.Format("<script type=""text/javascript"">window.open('{0}');</script>", Url))
            HttpContext.Current.Response.Flush()
        End Sub

    End Class


    Protected MustOverride ReadOnly Property ConnectionString() As String
    Protected MustOverride ReadOnly Property CrystalReportFileName() As String

    Protected Sub InitCrystalReportSource(ByVal rs As CrystalReportSource)
        Try
            rs.Report.FileName = CrystalReportFileName

            Dim server, database, user, password As String
            Dim db As New System.Data.Common.DbConnectionStringBuilder
            With db
                .ConnectionString = Me.ConnectionString
                server = CType(.Item("Data Source"), String)
                database = CType(.Item("Initial Catalog"), String)
                'user = CType(.Item("User ID"), String)
                'password = CType(.Item("Password"), String)
            End With

            Dim doc As CrystalDecisions.CrystalReports.Engine.ReportDocument = rs.ReportDocument
            If String.IsNullOrEmpty(password) Then
                For Each cn As IConnectionInfo In doc.DataSourceConnections
                    cn.SetConnection(server, database, True)
                Next
            Else
                For Each cn As IConnectionInfo In doc.DataSourceConnections
                    cn.SetConnection(server, database, user, password)
                Next
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

End Class
