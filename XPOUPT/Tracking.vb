Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TrackingPermohonan
		Inherits XPLiteObject
		Dim fPermohonanLogID As Guid
		<Key(true)> _
		Public Property PermohonanLogID() As Guid
			Get
				Return fPermohonanLogID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PermohonanLogID", fPermohonanLogID, value)
			End Set
		End Property
		Dim fCreateTime As DateTime
		Public Property CreateTime() As DateTime
			Get
				Return fCreateTime
			End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("CreateTime", fCreateTime, value)
            End Set
		End Property
		Dim fNamaEvent As String
		<Size(50)> _
		Public Property NamaEvent() As String
			Get
				Return fNamaEvent
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaEvent", fNamaEvent, value)
			End Set
		End Property
        Dim fJenisIzinId As JenisIzin
        Public Property JenisIzinId() As JenisIzin
            Get
                Return fJenisIzinId
            End Get
            Set(ByVal value As JenisIzin)
                SetPropertyValue(Of JenisIzin)("JenisIzinId", fJenisIzinId, value)
            End Set
        End Property
		Public Sub New(ByVal session As Session)
			MyBase.New(session)
		End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
