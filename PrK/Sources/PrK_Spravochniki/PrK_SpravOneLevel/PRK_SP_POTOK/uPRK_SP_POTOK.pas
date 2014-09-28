unit uPRK_SP_POTOK;

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
  TFormPRK_SP_POTOK = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPRK_SP_POTOK: TFormPRK_SP_POTOK;

implementation
uses uConstants;
{$R *.dfm}

procedure TFormPRK_SP_POTOK.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_POTOK';
  SelectSQLText        :='Select * from PRK_SP_POTOK_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_POTOK_ADD';
  StoredProcChangeName :='PRK_SP_POTOK_CHANGE';
  StoredProcDelName    :='PRK_SP_POTOK_DEL';

  InicFormCaption      :=nFormPRK_SP_POTOK_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
