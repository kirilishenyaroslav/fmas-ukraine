unit UP_uBonusDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TdmBonus = class(TDataModule)
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;




implementation

{$R *.dfm}

procedure TdmBonus.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
end;


end.
