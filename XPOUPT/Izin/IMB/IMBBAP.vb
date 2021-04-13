Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBBAP
		Inherits XPLiteObject
		Dim fIMBBAPID As Guid
		<Key(true)> _
		Public Property IMBBAPID() As Guid
			Get
				Return fIMBBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBBAPID", fIMBBAPID, value)
			End Set
		End Property
		Dim fIMBBAPNomor As String
		<Size(50)> _
		Public Property IMBBAPNomor() As String
			Get
				Return fIMBBAPNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IMBBAPNomor", fIMBBAPNomor, value)
			End Set
		End Property
		Dim fIMBBAPTanggal As DateTime
		Public Property IMBBAPTanggal() As DateTime
			Get
				Return fIMBBAPTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("IMBBAPTanggal", fIMBBAPTanggal, value)
			End Set
		End Property
		Dim fIMBBAPCatatan As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property IMBBAPCatatan() As String
			Get
				Return fIMBBAPCatatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IMBBAPCatatan", fIMBBAPCatatan, value)
			End Set
		End Property
		Dim fIMBBAPRekomendasi As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property IMBBAPRekomendasi() As String
			Get
				Return fIMBBAPRekomendasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IMBBAPRekomendasi", fIMBBAPRekomendasi, value)
			End Set
		End Property
		Dim fPermohonanID As Guid
		Public Property PermohonanID() As Guid
			Get
				Return fPermohonanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PermohonanID", fPermohonanID, value)
			End Set
		End Property
		Dim fIMBID As Guid
		Public Property IMBID() As Guid
			Get
				Return fIMBID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBID", fIMBID, value)
			End Set
		End Property
		Dim fIMBPemeriksaanID As Guid
		Public Property IMBPemeriksaanID() As Guid
			Get
				Return fIMBPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBPemeriksaanID", fIMBPemeriksaanID, value)
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
