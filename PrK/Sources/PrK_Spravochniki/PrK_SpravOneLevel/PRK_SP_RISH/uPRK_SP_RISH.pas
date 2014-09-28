unit uPRK_SP_RISH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, dxBar, dxBarExtItems, ImgList, ActnList, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar;

type
  TFormPRK_SP_RISH = class(TFormPrK_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormPRK_SP_RISH: TFormPRK_SP_RISH;

implementation
uses uPrK_Resources,uConstants;
{$R *.dfm}

{ TFormPRK_SP_RISH }

procedure TFormPRK_SP_RISH.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_RISH';
  SelectSQLText        :='Select * from PRK_SP_RISH_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_RISH_ADD';
  StoredProcChangeName :='PRK_SP_RISH_CHANGE';
  StoredProcDelName    :='PRK_SP_RISH_DEL';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_RISH_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
