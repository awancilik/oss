Option Explicit On
Option Strict On
Imports Bisnisobjek.OSS
Partial Class report_reportPage_IMB_IMBretribusiBulanan
    Inherits System.Web.UI.Page

    Protected Sub CariTanggal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariTanggal.Click
        Dim _startdate As Date = TglAwalDateEdit.Date
        Dim _enddate As Date = TglAhkirDateEdit.Date
        Dim RetribusiBulanan As New RetribusiBulanan.Parameters(_startdate, _enddate)
        RetribusiBulanan.OpenReportInNewWindow()
    End Sub
End Class