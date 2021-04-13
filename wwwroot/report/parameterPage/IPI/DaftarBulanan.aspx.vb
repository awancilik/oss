Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Partial Class report_parameterPage_IPI_DaftarBulanan
    Inherits System.Web.UI.Page

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim bulan As Integer = tanggalASPxDateEdit.Date.Month
        Dim tahun As Integer = tanggalASPxDateEdit.Date.Year
        Dim IPI As New IPIJmlIzinReport.Parameters(bulan, tahun)
        IPI.OpenReportInNewWindow()
    End Sub

End Class
