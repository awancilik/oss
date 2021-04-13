Option Explicit On
Option Strict On

Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class report_parameterPage_IPI_Petikan
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim nopermohonan As String = NoPermohonanASPxTextbox.Text.Trim
        Dim komoditi As String = Trim(CreateKomoditiString(nopermohonan))
        Dim kapasitas As String = Trim(CreateKapasitasString(nopermohonan))
        Dim petikan As New IPIPetikan.Parameters(nopermohonan, komoditi, kapasitas)
        If Cek(nopermohonan) = True Then
            petikan.OpenReportInNewWindow()
        Else
            PeringatanASPxPopupControl.ShowOnPageLoad = True
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

    Private Function CreateKomoditiString(ByVal perm As String) As String
        CreateKomoditiString = ""
        session1 = New Session

        Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & perm.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
        If objPermohonan IsNot Nothing Then
            Dim ipiID As String = ""
            For Each item As PermohonanDetail In objPermohonan.PermohonanDetail
                If item.JenisIzinID.JenisIzinNama = "IPI" Then
                    ipiID = item.PermohonanIzinID.ToString
                End If
            Next
            If Not String.IsNullOrEmpty(ipiID) Then
                Dim queryIpi As CriteriaOperator = CriteriaOperator.Parse("IPIID.IPIID='" & ipiID & "'")
                Dim xpColl As XPCollection(Of IPIKomoditi) = New XPCollection(Of IPIKomoditi)(session1, queryIpi)
                For Each item As IPIKomoditi In xpColl
                    If String.IsNullOrEmpty(CreateKomoditiString) Then
                        CreateKomoditiString = CreateKomoditiString & " " & item.Komoditi
                    Else
                        CreateKomoditiString = CreateKomoditiString & ", " & item.Komoditi
                    End If
                Next
            End If
            Return CreateKomoditiString
        End If
    End Function

    Private Function CreateKapasitasString(ByVal perm As String) As String
        CreateKapasitasString = ""
        session1 = New Session

        Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & perm.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
        If objPermohonan IsNot Nothing Then
            Dim ipiID As String = ""
            For Each item As PermohonanDetail In objPermohonan.PermohonanDetail
                If item.JenisIzinID.JenisIzinNama = "IPI" Then
                    ipiID = item.PermohonanIzinID.ToString
                End If
            Next
            If Not String.IsNullOrEmpty(ipiID) Then
                Dim queryIpi As CriteriaOperator = CriteriaOperator.Parse("IPIID.IPIID='" & ipiID & "'")
                Dim xpColl As XPCollection(Of IPIKomoditi) = New XPCollection(Of IPIKomoditi)(session1, queryIpi)
                For Each item As IPIKomoditi In xpColl
                    If String.IsNullOrEmpty(CreateKapasitasString) Then
                        CreateKapasitasString = CreateKapasitasString & " " & item.Kapasitas
                    Else
                        CreateKapasitasString = CreateKapasitasString & ", " & item.Kapasitas
                    End If
                Next
            End If
            Return CreateKapasitasString
        End If
    End Function

End Class
