Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOBAP
		Inherits XPLiteObject
		Dim fHOBAPID As Guid
		<Key(true)> _
		Public Property HOBAPID() As Guid
			Get
				Return fHOBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOBAPID", fHOBAPID, value)
			End Set
        End Property

        Dim fHOID As HO
        Public Property HOID() As HO
            Get
                Return fHOID
            End Get
            Set(ByVal value As HO)
                SetPropertyValue(Of HO)("HOID", fHOID, value)
            End Set
        End Property

        Dim fKesimpulan As String
        Public Property Kesimpulan() As String
            Get
                Return fKesimpulan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Kesimpulan", fKesimpulan, value)
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
