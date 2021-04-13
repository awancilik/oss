Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOUsahaBersifatSosial
		Inherits XPLiteObject
		Dim fHOUsahaBersifatSosialID As Guid
		<Key(true)> _
		Public Property HOUsahaBersifatSosialID() As Guid
			Get
				Return fHOUsahaBersifatSosialID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOUsahaBersifatSosialID", fHOUsahaBersifatSosialID, value)
			End Set
        End Property
        Dim fHOID As HO
        Public Property ho() As HO
            Get
                Return fHOID
            End Get
            Set(ByVal value As HO)
                SetPropertyValue(Of HO)("HOID", fHOID, value)
            End Set
        End Property
		Dim fJenisLingkungan As String
		<Size(200)> _
		Public Property JenisLingkungan() As String
			Get
				Return fJenisLingkungan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisLingkungan", fJenisLingkungan, value)
			End Set
		End Property
		Dim fTarif As Decimal
		Public Property Tarif() As Decimal
			Get
				Return fTarif
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Tarif", fTarif, value)
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
