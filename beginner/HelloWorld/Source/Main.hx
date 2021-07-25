package;

/**
 * exibir os dados
 */
import openfl.display.Bitmap;


import openfl.display.Sprite;

/**
 * import para adicionar imagem
 */
import openfl.Assets;

class Main extends Sprite
{
	public function new()
	{
		super();
		var bitmapData = Assets.getBitmapData ("assets/sol.jpg");
		var bitmap = new Bitmap (bitmapData);

		/**
		 * Para ver nossa instância de Bitmap, usamos addChild para torná-la visível na lista de exibição. A “lista de exibição” é um método de desenho fácil de usar que está disponível no OpenFL.
		 */
		addChild (bitmap);

	/**
	 * Ao usar a lista de exibição, você pode usar as propriedades x e y para controlar onde um objeto será desenhado.
	 * bitmap.x = 100;
	 * bitmap.y = 200;
	 * 
	 * Se definirmos a posição do bitmap como (100, 200), em vez de desenhar no canto superior esquerdo da janela, ele estará 100 e 200
	 * pixels de distância do canto, respectivamente. Você pode usar qualquer valor que desejar, mas, para este exemplo, centralizaremos
	 * imagem.
	 */


	/**
	 * Podemos determinar a largura de nossa janela usando os valores stage.stageWidth e stage.stageHeight. Podemos usar os valores de
	 * largura e altura de nosso bitmap para descobrir quão grande ele é. O código resultante é parecido com este:
	 */
	 bitmap.x = (stage.stageWidth - bitmap.width) / 2;
	 bitmap.y = (stage.stageHeight - bitmap.height) / 2;
	 
	}
}
