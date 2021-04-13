Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOTaripLingkungan
		Inherits XPLiteObject
		Dim fHOTaripLingkunganID As Guid
        <Key(True)> _
                  <Association("HOTaripLingkungan-HOJenisLingkungan")> _
              Public Property HOTaripLingkunganID() As Guid
            Get
                Return fHOTaripLingkunganID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HOTaripLingkunganID", fHOTaripLingkunganID, value)
            End Set
        End Property
        Dim fJenisTaripLingkungan As String
        <Size(200)> _
        Public Property JenisTaripLingkungan() As String
            Get
                Return fJenisTaripLingkungan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisTaripLingkungan", fJenisTaripLingkungan, value)
            End Set
        End Property
        <Association("HOTaripLingkungan-HOJenisLingkungan")> _
        Public ReadOnly Property HOJenisLingkungan() As XPCollection(Of HOJenisLingkungan)
            Get
                Return GetCollection(Of HOJenisLingkungan)("HOJenisLingkungan")
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
