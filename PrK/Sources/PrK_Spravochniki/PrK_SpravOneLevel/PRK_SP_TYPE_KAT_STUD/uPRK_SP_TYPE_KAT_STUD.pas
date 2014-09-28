unit uPRK_SP_TYPE_KAT_STUD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar;

type
  TFormPRK_SP_TYPE_KAT_STUD = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_TYPE_KAT_STUD: TFormPRK_SP_TYPE_KAT_STUD;

implementation
uses uPrK_Resources,uConstants, uPrKKlassSprav, AArray;
{$R *.dfm}

procedure TFormPRK_SP_TYPE_KAT_STUD.FormCreate(Sender: TObject);
var pShowAll:Boolean;
begin
  inherited;
  pShowAll:=False;
  if Assigned(ParamSprav) then
   if Assigned(ParamSprav['Input']) then
    if Assigned(ParamSprav['Input']['ShowAll']) then
     pShowAll:=ParamSprav['Input']['ShowAll'].AsVariant;
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_TYPE_KAT_STUD';
  if pShowAll then
    SelectSQLText      :='Select * from PRK_SP_TYPE_KAT_STUD_SEL_ALL'
  else
    SelectSQLText      :='Select * from PRK_SP_TYPE_KAT_STUD_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_TYPE_KAT_STUD_ADD';
  StoredProcChangeName :='PRK_SP_TYPE_KAT_STUD_CHANGE';
  StoredProcDelName    :='PRK_SP_TYPE_KAT_STUD_DEL';
  NamePrKSpravEdit     :=PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_TYPE_KAT_STUD_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
