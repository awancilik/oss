Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class report_parameterPage_SIUP_TandaBuktiPembayaran
    Inherits System.Web.UI.Page
    Private session1 As Session


    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text.Trim.ToString
        Dim Izin As String = JenisIzinASPxComboBox.Text.Trim

        If Izin = "SIUP Cabang" Or Izin = "SIUP Koperasi" Or Izin = "SIUP PT" Or Izin = "SIUP Perorangan" Or Izin = "SIUP CV" Then
            If cSIUP(noPermohonan, Izin) Then
                Dim cSIup As New TBP.Parameters(noPermohonan)
                cSIup.OpenReportInNewWindow()
            End If
        ElseIf Izin = "Lokasi" Then

        ElseIf Izin = "IPI" Then

        ElseIf Izin = "IPT" Then

        ElseIf Izin = "TDP" Then

        ElseIf Izin = "IUI" Then

        ElseIf Izin = "TDI" Then

        ElseIf Izin = "IMB" Then

        ElseIf Izin = "HO" Then

        Else

        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        JenisXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Izin "
    Private Function cSIUP(ByVal no As String, ByVal izin As String) As Boolean
        Dim obj1 As Permohonan = session1.FindObject(Of Permohonan)(New BinaryOperator("NomorPermohonan", no))
        If obj1 IsNot Nothing Then
            Dim obj2 As SIUP = session1.FindObject(Of SIUP)(New BinaryOperator("PermohonanID", obj1.PermohonanID))
            If obj2 IsNot Nothing Then
                If obj2.JenisIzinID.JenisIzinNama = izin Then
                    cSIUP = True
                Else
                    cSIUP = False
                End If
            End If
        End If
    End Function
#End Region
End Class
