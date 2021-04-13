Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors

Partial Class Utility_Izin_TDP_TDPRetribusi
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        TDPXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - PD - TDP"

    Protected Sub CarASpxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CarASpxButton.Click
        If NoPermohonanASPxTextBox.Text IsNot Nothing Then
            Dim objPermohonan As Permohonan = session1.FindObject(Of Permohonan)(New BinaryOperator("NomorPermohonan", NoPermohonanASPxTextBox.Text.Trim))
            If objPermohonan IsNot Nothing Then
                If CekPD(objPermohonan) Then
                    TDPDetailView.Visible = True
                    TDPDetailView.ChangeMode(DetailsViewMode.Edit)
                Else
                    TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
                End If
            End If
        End If
    End Sub

    Private Function CekPD(ByVal obj As Permohonan) As Boolean
        Dim objPD As PermohonanDetail = session1.FindObject(Of PermohonanDetail)(CriteriaOperator.Parse( _
                                         "JenisIzinID.JenisIzinNama LIKE 'TDP%' And PermohonanID='" & obj.PermohonanID.ToString & _
                                         "'"))
        If objPD IsNot Nothing Then
            If CekTDP(objPD) Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekTDP(ByVal obj As PermohonanDetail) As Boolean
        Dim TDPID As CriteriaOperator = CriteriaOperator.Parse("TDPID='" & obj.PermohonanIzinID.ToString & "'")
        Dim objTDP As TDP = DirectCast(session1.FindObject(GetType(TDP), TDPID), TDP)
        If objTDP IsNot Nothing Then
            Session("TDPID") = objTDP.TDPID
            Return True
        Else
            Session("TDPID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " Detail View "

    Protected Sub TDPDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles TDPDetailView.DataBound
        If TDPDetailView.CurrentMode = DetailsViewMode.Edit Then
            Dim dv As DetailsView = TDPDetailView
            Dim id As CriteriaOperator = CriteriaOperator.Parse("TDPID='" & Session("TDPID").ToString & "'")
            Dim obj As TDP = DirectCast(session1.FindObject(GetType(TDP), id), TDP)
            If obj IsNot Nothing Then
                Dim tbRetribusi As ASPxTextBox = DirectCast(dv.FindControl("RetribusiASPxTextBox"), ASPxTextBox)
                tbRetribusi.Text = CStr(Tarif(obj))
            End If
        End If
    End Sub

    Private Function Tarif(ByVal obj As TDP) As Decimal
        If obj.Kategori IsNot "" Then
            Dim kategori As String = obj.Kategori
            If kategori = "Kecil" Then
                Tarif = 50000
            ElseIf kategori = "Sedang" Then
                Tarif = 150000
            Else
                Tarif = 300000
            End If
        End If
    End Function

    Protected Sub TDPDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles TDPDetailView.ItemUpdated
        TDPDetailView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub TDPDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles TDPDetailView.ItemUpdating
        Dim dv As DetailsView = TDPDetailView
        Dim tbRetribusi As ASPxTextBox = DirectCast(dv.FindControl("RetribusiASPxTextBox"), ASPxTextBox)
        Dim obj As TDP = DirectCast(session1.FindObject(GetType(TDP), CriteriaOperator.Parse("TDPID='" & Session("TDPID").ToString & "'")), TDP)
        If obj IsNot Nothing Then
            Dim Baca As New Baca
            obj.Retribusi = CDec(tbRetribusi.Text)
            obj.RetribusiTerbilang = Baca.Terbilang(CInt(obj.Retribusi).ToString)
            obj.Save()
        End If
    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("TDPID") = Nothing
        End If
    End Sub



End Class
