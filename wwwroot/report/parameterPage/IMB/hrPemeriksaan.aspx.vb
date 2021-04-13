Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Partial Class report_hrPemeriksaan
    Inherits System.Web.UI.Page
    Private session1 As New Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        PemeriksaXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub CariButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariButton.Click
        Dim pemeriksa As Guid = New Guid(PemeriksaComboBox.Value.ToString)
        Dim tanggal As Date = TanggalDateEdit.Date
        Dim periksa As New Pemeriksaan.Parameters(tanggal, pemeriksa)
        periksa.OpenReportInNewWindow()
    End Sub
End Class
