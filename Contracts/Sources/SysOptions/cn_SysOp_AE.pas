unit cn_SysOp_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxGroupBox, StdCtrls, cxButtons;

type
  TfrmSysOp_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cn_max_sys_timestamp_Edit: TcxTextEdit;
    cn_id_rate_account_Edit: TcxTextEdit;
    cn_def_id_customer_Edit: TcxTextEdit;
    cn_def_smeta_Edit: TcxTextEdit;
    cn_def_razdel_Edit: TcxTextEdit;
    cn_kod_dog_Edit: TcxTextEdit;
    cn_def_stat_Edit: TcxTextEdit;
    cn_def_kekv_Edit: TcxTextEdit;
    cn_def_id_type_stage_Edit: TcxTextEdit;
    cn_date_start_Edit: TcxTextEdit;
    cn_filterdoc_Edit: TcxTextEdit;
    cn_max_date_Edit: TcxTextEdit;
    cn_smlining_Edit: TcxTextEdit;
    cn_get_dog_from_buffer_Edit: TcxTextEdit;
    cn_nomenklat_nomer_Edit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    cn_date_prov_Edit: TcxTextEdit;
    Label16: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSysOp_AE: TfrmSysOp_AE;

implementation

{$R *.dfm}

end.
