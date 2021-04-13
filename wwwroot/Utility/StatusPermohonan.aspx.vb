Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports Bisnisobjek.OSS

Partial Class Utility_StatusPermohonan
    Inherits System.Web.UI.Page

    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        permohonanDetailXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Protected Sub updatestatusASPxGridView_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        Dim dv As DetailsView = permohonanDetailsView
        Dim id As Guid = New Guid(e.Keys.Item("PermohonanDetailID").ToString)
        Dim obj As PermohonanDetail = session1.GetObjectByKey(Of PermohonanDetail)(id)
        If obj IsNot Nothing Then
            With obj
                Dim izin As String = .JenisIzinID.JenisIzinNama.Trim
                If izin = "IMB" Then
                    IMB(obj, dv)
                ElseIf izin = "Lokasi" Then
                    Lokasi(obj, dv)
                ElseIf izin = "IUI" Then
                    IUI(obj, dv)
                ElseIf izin = "IPI" Then
                    IPI(obj, dv)
                ElseIf izin = "TDI" Then
                    TDI(obj, dv)
                ElseIf izin = "HO" Then
                    HO(obj, dv)
                Else
                    SIUP(obj, dv)
                End If

            End With
        End If
    End Sub
 
#Region " Jenis Izin "

    Private Sub IMB(ByVal pd As PermohonanDetail, ByVal dv As DetailsView)
        Dim obj As IMB = session1.GetObjectByKey(Of IMB)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIjin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Sub
    Private Sub Lokasi(ByVal pd As PermohonanDetail, ByVal dv As DetailsView)
        Dim obj As Lokasi = session1.GetObjectByKey(Of Lokasi)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIzin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Sub
    Private Sub IUI(ByVal pd As PermohonanDetail, ByVal dv As DetailsView)
        Dim obj As IUI = session1.GetObjectByKey(Of IUI)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIzin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Sub
    Private Function IPI(ByVal pd As PermohonanDetail, ByVal dv As DetailsView) As String
        Dim obj As IPI = session1.GetObjectByKey(Of IPI)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIzin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Function

    Private Function TDI(ByVal pd As PermohonanDetail, ByVal dv As DetailsView) As String
        Dim obj As TDI = session1.GetObjectByKey(Of TDI)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIzin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Function

    Private Function HO(ByVal pd As PermohonanDetail, ByVal dv As DetailsView) As String
        Dim obj As HO = session1.GetObjectByKey(Of HO)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIzin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Function

    Private Function SIUP(ByVal pd As PermohonanDetail, ByVal dv As DetailsView) As String
        Dim obj As SIUP = session1.GetObjectByKey(Of SIUP)(pd.PermohonanIzinID)
        If obj IsNot Nothing Then
            With obj
                Dim gv As ASPxGridView = CType(dv.FindControl("permohonanDetailASPxGridView"), ASPxGridView)
                Dim tb As ASPxTextBox = CType(gv.FindEditRowCellTemplateControl(DirectCast(gv.Columns("Nomor Izin"), GridViewDataColumn), "noIzin"), ASPxTextBox)
                If tb IsNot Nothing Then
                    .NoIjin = tb.Text.Trim
                    .Save()
                End If
            End With
        End If
    End Function

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
        End If
    End Sub
 
End Class
