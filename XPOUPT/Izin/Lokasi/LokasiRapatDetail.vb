Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiRapatDetail
		Inherits XPLiteObject
		Dim fLokasiRapatDetailID As Guid
		<Key(true)> _
		Public Property LokasiRapatDetailID() As Guid
			Get
				Return fLokasiRapatDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiRapatDetailID", fLokasiRapatDetailID, value)
			End Set
		End Property
        Dim fLokasiRapatID As LokasiRapat
        Public Property LokasiRapatID() As LokasiRapat
            Get
                Return fLokasiRapatID
            End Get
            Set(ByVal value As LokasiRapat)
                SetPropertyValue(Of LokasiRapat)("LokasiRapatID", fLokasiRapatID, value)
            End Set
        End Property
        Dim fTimRapatID As TimPemeriksa
        Public Property TimRapatID() As TimPemeriksa
            Get
                Return fTimRapatID
            End Get
            Set(ByVal value As TimPemeriksa)
                SetPropertyValue(Of TimPemeriksa)("TimRapatID", fTimRapatID, value)
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
