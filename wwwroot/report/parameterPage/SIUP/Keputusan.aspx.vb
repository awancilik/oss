﻿Option Explicit On
Option Strict On

Partial Class report_parameterPage_SIUP_Keputusan
    Inherits System.Web.UI.Page

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text.Trim.ToString
        Dim keputusan As New report_reportPage_SIUP_Keputusan.Parameters(noPermohonan)
        keputusan.OpenReportInNewWindow()
    End Sub
End Class
