unit datamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, pFIBDatabase, IBDatabase, Db, IBCustomDataSet, IBTable,
  pFIBErrorHandler, cxContainer, cxEdit, cxLookAndFeels, cxStyles,
  cxClasses, cxGridTableView;

type
  Tdm = class(TDataModule)
    DataBase: TpFIBDatabase;
    EditStyleController1: TcxEditStyleController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    HistTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.DFM}

procedure Tdm.DataModuleCreate(Sender: TObject);
{var
 i : integer;}
begin
{ for i := 0 to cxStyleRepository1.Count - 1 do begin
  if (cxStyleRepository1.Items[i] as TcxStyle).Color = clInfoBk then (cxStyleRepository1.Items[i] as TcxStyle).Color := EditStyleController1.Style.Color;
 end;}
end;

end.


