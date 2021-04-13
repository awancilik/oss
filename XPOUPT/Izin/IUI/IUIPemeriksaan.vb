Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIPemeriksaan
		Inherits XPLiteObject
		Dim fIUIPemeriksaanID As Guid
		<Key(true)> _
		Public Property IUIPemeriksaanID() As Guid
			Get
				Return fIUIPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIPemeriksaanID", fIUIPemeriksaanID, value)
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

		Dim fIUIID As Guid
		Public Property IUIID() As Guid
			Get
				Return fIUIID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIID", fIUIID, value)
			End Set
        End Property

		Dim fIUIPemeriksaanNomor As String
		<Size(50)> _
		Public Property IUIPemeriksaanNomor() As String
			Get
				Return fIUIPemeriksaanNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IUIPemeriksaanNomor", fIUIPemeriksaanNomor, value)
			End Set
        End Property

		Dim fIUIPemeriksaanTanggal As DateTime
		Public Property IUIPemeriksaanTanggal() As DateTime
			Get
				Return fIUIPemeriksaanTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("IUIPemeriksaanTanggal", fIUIPemeriksaanTanggal, value)
			End Set
        End Property

        <Association("IUIPemeriksaan-IUIPemeriksaanDetail")> _
        Public ReadOnly Property IUIPemeriksaanDetail() As XPCollection(Of IUIPemeriksaanDetail)
            Get
                Return GetCollection(Of IUIPemeriksaanDetail)("IUIPemeriksaanDetail")
            End Get
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
