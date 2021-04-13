Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDPDataUmumPerusahaan
		Inherits XPLiteObject
		Dim fTDPDataUmumPerusahaanID As Guid
		<Key(true)> _
		Public Property TDPDataUmumPerusahaanID() As Guid
			Get
				Return fTDPDataUmumPerusahaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDPDataUmumPerusahaanID", fTDPDataUmumPerusahaanID, value)
			End Set
        End Property
        Dim fTDPID As TDP
        Public Property TDPID() As TDP
            Get
                Return fTDPID
            End Get
            Set(ByVal value As TDP)
                SetPropertyValue(Of TDP)("TDPID", fTDPID, value)
            End Set
        End Property
		Dim fNamaPerusahaanInduk As String
		<Size(200)> _
		Public Property NamaPerusahaanInduk() As String
			Get
				Return fNamaPerusahaanInduk
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaPerusahaanInduk", fNamaPerusahaanInduk, value)
			End Set
		End Property
		Dim fNomorTDP As String
		<Size(50)> _
		Public Property NomorTDP() As String
			Get
				Return fNomorTDP
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NomorTDP", fNomorTDP, value)
			End Set
		End Property
		Dim fAlamatPerusahaan As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property AlamatPerusahaan() As String
			Get
				Return fAlamatPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("AlamatPerusahaan", fAlamatPerusahaan, value)
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
