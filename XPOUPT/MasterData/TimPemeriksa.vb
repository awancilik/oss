Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TimPemeriksa
		Inherits XPLiteObject
		Dim fTimPemeriksaID As Guid
		<Key(true)> _
		Public Property TimPemeriksaID() As Guid
			Get
				Return fTimPemeriksaID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TimPemeriksaID", fTimPemeriksaID, value)
			End Set
		End Property
		Dim fTimPemeriksaNama As String
		<Size(50)> _
		Public Property TimPemeriksaNama() As String
			Get
				Return fTimPemeriksaNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TimPemeriksaNama", fTimPemeriksaNama, value)
			End Set
		End Property
		Dim fTimPemeriksaInstansi As String
		Public Property TimPemeriksaInstansi() As String
			Get
				Return fTimPemeriksaInstansi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TimPemeriksaInstansi", fTimPemeriksaInstansi, value)
			End Set
        End Property
        Dim fTimPemeriksaNIP As String
        Public Property TimPemeriksaNIP() As String
            Get
                Return fTimPemeriksaNIP
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("TimPemeriksaNIP", fTimPemeriksaNIP, value)
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
