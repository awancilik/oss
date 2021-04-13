Option Explicit On
Option Strict On
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Xpo
Partial Class report_parameterPage_TDI_Keputusan
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim noPermohonan As String = noPermohonanASPxTextBox.Text.Trim
        Dim Pembantu As String = buatPembantu(noPermohonan)
        Dim jenisusahanama As String = buatJenisUsahaNama(noPermohonan)
        If Pembantu = "" Then
            Pembantu = "-"
        End If
        If jenisusahanama = "" Then
            jenisusahanama = "-"
        End If
        Dim rKeputusan As New TDIKeputusan.Parameters(noPermohonan, Pembantu, jenisusahanama)
        If Cek(noPermohonan) Then
            rKeputusan.OpenReportInNewWindow()
        End If
    End Sub

    Private Function Cek(ByVal nomor As String) As Boolean
        Dim cari As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & nomor & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), cari), Permohonan)
        If objPermohonan IsNot Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

    Private Function buatPembantu(ByVal noPermohonan As String) As String
        Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
        buatPembantu = ""
        session1 = New Session
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
        Dim TDIID As String = ""
        For Each item As PermohonanDetail In objPermohonan.PermohonanDetail
            If item.JenisIzinID.JenisIzinNama = "TDI" Then
                TDIID = item.PermohonanIzinID.ToString
            End If
        Next
        If Not String.IsNullOrEmpty(TDIID) Then
            Dim queryTDI As CriteriaOperator = CriteriaOperator.Parse("TDIID='" & TDIID & "' And Guna='Pembantu'")
            Dim xpColl As XPCollection(Of TDIMesin) = New XPCollection(Of TDIMesin)(session1, queryTDI)
            For Each item As TDIMesin In xpColl
                If String.IsNullOrEmpty(buatPembantu) Then
                    buatPembantu = buatPembantu & " " & item.NamaMesin & " " & item.Jumlah & " " & item.Satuan
                Else
                    buatPembantu = buatPembantu & ", " & item.NamaMesin & " " & item.Jumlah & " " & item.Satuan
                End If
            Next
        End If
        Return buatPembantu
    End Function

    Private Function buatJenisUsahaNama(ByVal noPermohonan As String) As String
        Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
        buatJenisUsahaNama = ""
        session1 = New Session
        Dim objpermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
        Dim tdiid As String = ""
        For Each item As PermohonanDetail In objpermohonan.PermohonanDetail
            If item.JenisIzinID.JenisIzinNama = "TDI" Then
                tdiid = item.PermohonanIzinID.ToString
            End If
        Next
        If Not String.IsNullOrEmpty(tdiid) Then
            Dim query1 As CriteriaOperator = CriteriaOperator.Parse("TDIID='" & tdiid & "'")
            Dim obj As TDIDetail = DirectCast(session1.FindObject(GetType(TDIDetail), query1), TDIDetail)
            Dim xpColl As XPCollection(Of TDIDetail) = New XPCollection(Of TDIDetail)(session1, query1)
            For Each item As TDIDetail In xpColl
                If String.IsNullOrEmpty(buatJenisUsahaNama) Then
                    buatJenisUsahaNama = buatJenisUsahaNama & " " & item.KLUIID.JenisUsahaNama
                Else
                    buatJenisUsahaNama = buatJenisUsahaNama & ", " & item.KLUIID.JenisUsahaNama
                End If
            Next
        End If

    End Function
End Class
