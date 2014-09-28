unit uDocWorkPosKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxDropDownEdit, cxCalendar, cxTextEdit, cxCheckBox,
  cxCurrencyEdit, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, StdCtrls,
  cxPC, cxControls;

type
  TForm1 = class(TForm)
    cxPageControl: TcxPageControl;
    cxTabSheetPos: TcxTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxName: TcxButtonEdit;
    cxKolDoc: TcxCurrencyEdit;
    cxKolMat: TcxCurrencyEdit;
    cxSumma: TcxCurrencyEdit;
    cxPrice: TcxCurrencyEdit;
    cxUnit: TcxButtonEdit;
    cxNameSch: TcxButtonEdit;
    cxCheckWorkPos: TcxCheckBox;
    cxPosNote: TcxTextEdit;
    cxTabSheetInv: TcxTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    LabelID_Am_grp: TLabel;
    LabelPercent: TLabel;
    LabelPer_Nachisl: TLabel;
    LabelBuh_id_db_sch: TLabel;
    LabelBuh_id_kr_sch: TLabel;
    Label22: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxButtonEditID_Am_grp: TcxButtonEdit;
    cxCurrencyEditPersent: TcxCurrencyEdit;
    cxComboBoxPeriodNach: TcxComboBox;
    cxButtonEditBuh_id_db_sch: TcxButtonEdit;
    cxButtonEditBuh_id_kr_sch: TcxButtonEdit;
    cxCurrencyEdit3: TcxCurrencyEdit;
    cxTabSheetMna: TcxTabSheet;
    Label17: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    cxNNum: TcxTextEdit;
    cxNNumExt: TcxTextEdit;
    cxDateOpr: TcxDateEdit;
    cxDateExpl: TcxDateEdit;
    cxINum: TcxTextEdit;
    cxZavNum: TcxTextEdit;
    cxPassNum: TcxTextEdit;
    cxModel: TcxTextEdit;
    cxMarka: TcxTextEdit;
    cxNote: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
