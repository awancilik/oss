Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Partial Class report_parameterPage_TDI_DaftarBulanan
    Inherits System.Web.UI.Page

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim bulan As Integer = tanggalASPxDateEdit.Date.Month
        Dim tahun As Integer = tanggalASPxDateEdit.Date.Year
        Dim tdi As New TDIJmlIzinReport.Parameters(bulan, tahun)
        tdi.OpenReportInNewWindow()
    End Sub

End Class
