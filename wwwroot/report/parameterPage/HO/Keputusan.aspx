<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Keputusan.aspx.vb" Inherits="report_parameterPage_HO_Keputusan" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1>Pilih Jenis Perjanjian Izin Gangguan</h1>
    <table>
        <tr>
            <td>
                <div class="left clearfix">
                <asp:LinkButton ID="LinkButton" runat="server" PostBackUrl="~/report/parameterPage/HO/KeputusanHO.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan HO Milik Sendiri</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/report/parameterPage/HO/KeputusanHO5Tahun.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan HO Sewa 5 Tahun</span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Gangguan Untuk Sewa 5 Tahun<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            <div class="left clearfix">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/report/parameterPage/HO/KeputusanHO5Lebih.aspx">
                <div class="inner_left image">
                    <img alt="Cetak Keputusan HO" src="../../../gambar/Icon/laporan.gif" style="border:none;" />
                </div>
                <div class="inner_left text">
                    <span class="header_text">Cetak Keputusan HO Sewa Lebih Dari 5 Tahun </span>
                    <span class="ket_text">
                        Berfungsi untuk membuat keputusan Izin Gangguan<br />
                    </span>
                </div> 
                </asp:LinkButton>
            </div>
            </td>
        </tr>
    </table>

</asp:Content>

