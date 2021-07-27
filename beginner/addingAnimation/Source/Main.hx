package;

import motion.easing.Elastic;

/**
 * Assim que o Actuate estiver incluído no último dos haxelibs para o seu projeto, em seguida, precisamos adicionar uma declaração de importação em “Main.hx”
 */
import motion.Actuate;

import openfl.display.Sprite;

/* O mais fácil de exibir nossos dados é usando o tipo openfl.display.Bitmap, você pode usar o mesmo BitmapData com várias instâncias de Bitmap, da maneira que quiser.
 */
import openfl.display.Bitmap;

import openfl.Assets;

class Main extends Sprite
{
	public function new()
	{
		super();

		var bitmap = new Bitmap (Assets.getBitmapData ("assets/sol.jpg"));
		/**
		 * Para ver nossa instância de Bitmap, usamos addChild para torná-la visível na lista de exibição. A “lista de exibição” é um método de desenho fácil de usar que está disponível no OpenFL.

		 */

		/**
		 * addChild (bitmap);
		 */
		

		/**
	 	* Actuate tem um método de interpolação que aceita um objeto para animar, a duração da animação e, em terceiro lugar, um objeto com 		valores alvo para cada propriedade que você deseja alterar ao longo do tempo. Para animar a posição x da imagem para fazê-la se mover 		pela tela, por exemplo, poderíamos usar o seguinte:
	 	*/

		/*Actuate.tween (bitmap, 3, {x: 200});
		*/
		
		/**
	 	* Isso animará o objeto ao longo de quatro segundos, de sua posição x original (que era o valor padrão de 0) para uma posição x na tela de 200. Vá em frente e execute seu projeto (como aprendemos no tutorial anterior ) e veja como fica. As interpolações podem ser usadas para animar qualquer valor numérico, incluindo o alfa (ou transparência) de um objeto para fazê-lo desaparecer, ou scaleX ou scaleY para alterar a escala. Para fazer a imagem desaparecer, definiríamos o valor alfa da imagem como 0 e, em seguida, adicionaríamos uma interpolação para aumentar o alfa para 1 ou totalmente visível. O código a seguir animará a imagem de invisível para visível, além de 	alterar o valor x:
	 	*/
		
		/*
		*Actuate.tween (bitmap, 3, {alpha: 1, x: 200});
		*/
	
		/**
		* Usando modificadores Tween
		Actuate tem vários modificadores de interpolação que você pode usar para alterar o comportamento de uma interpolação padrão. Você pode atrasar o tempo de início ou fazer um retorno de chamada para outro código quando uma animação for concluída. Um dos modificadores de interpolação comuns usados ​​com Actuate é o modificador de atenuação.

		Actuate usa algo que é chamado de “equação de atenuação” para calcular todas as posições intermediárias dos valores inicial e final de uma animação. Esta equação determina a velocidade ou aceleração durante uma animação. Por exemplo, uma animação que avança na mesma velocidade o tempo todo seria uma equação linear - comparar a quantidade de mudança ao longo do tempo seria constante, como uma linha reta. A princípio, pode parecer uma escolha óbvia para a equação padrão no Actuate, mas para a maioria dos projetos, uma equação linear pode parecer monótona e parecer a centelha de uma animação mais emocionante. Por esse motivo, o padrão Actuate é a equação exponencial mais “exótica”, que acelera rapidamente e, em seguida, desacelera até parar perto do fim, mais como uma montanha-russa.

		No entanto, se você começar a usar diferentes equações de atenuação, pode ser ideal separar uma animação em várias interpolações. Dessa forma, você pode usar um estilo de atenuação para uma parte da animação e um tipo diferente de atenuação para outra. Uma atenuação que parece ótima ao alterar a posição x ou y de um objeto pode se comportar mal quando usada para alterar a visibilidade (alfa) do mesmo objeto.

		Você pode usar uma equação de atenuação diferente importando uma do pacote “motion.easing” e adicionando-a à sua animação. Por exemplo, para usar uma equação Elastic.easeOut apenas para o valor x, você pode usar o seguinte código:
	 	*/

		/*
		*Actuate.tween (bitmap, 3, { alpha: 1});
		Actuate.tween (bitmap, 3, {x: 200}).ease (Elastic.easeOut);
		*/

		/**
	 	* Smoothing Bitmaps
		By default, the OpenFL Bitmap class is not set for smoothing. When displaying an image that is not scaled or rotated, it will look fine and may have faster performance than when smoothing is enabled. However, if you decide to scale the image, it can begin to look poor and rasterized, so it is often ideal to enable smoothing in these cases.

		You can enable smoothing for a Bitmap using the smoothing property: 

			bitmap.smoothing = true;
	 	*/

		/**
	 	* Por exemplo, se decidirmos dimensionar nossa imagem para fazê-la “saltar” e aparecer, poderíamos usar nossa animação anterior na escalaX e escalaY do objeto (em vez do valor x) 
	 	*/

		/**bitmap.alpha = 0;
		 bitmap.scaleX = 0;
		 bitmap.scaleY = 0;
		 bitmap.smoothing = true;

		 Actuate.tween (bitmap, 3, {alpha: 1});
		 Actuate.tween (bitmap, 6, {scaleX: 1, scaleY: 1}).ease (Elastic.easeOut);
		 **/

		/**
	 	* Os objetos de exibição OpenFL têm uma origem no canto superior esquerdo do objeto. Para a maioria das operações, como x, y, largura e altura, isso facilita o manuseio dos objetos. No entanto, às vezes você pode querer alterar o ponto de origem do objeto. Por exemplo, no código acima, definimos o objeto para animar a escala de 0 a 1. Isso irá dimensionar o objeto a partir do canto superior esquerdo, que pode não ser o efeito que desejamos. É simples alterar o ponto de origem de um objeto colocando-o dentro de um contêiner de objeto de exibição. A forma mais comum de contêiner de objeto de exibição é a classe Sprite, então, em vez de animar nossa imagem diretamente para o palco, podemos adicionar nossa imagem a um Sprite pai e animar o pai com algumas pequenas alterações:
	 	*/

		/**bitmap.x = - bitmap.width / 2;
		bitmap.y = - bitmap.height / 2;
		bitmap.smoothing = true;

		var container = new Sprite ();
		container.addChild (bitmap);
		container.alpha = 0;
		container.scaleX = 0;
		container.scaleY = 0;

		addChild (container);

		Actuate.tween (container, 3, { alpha: 1});
		Actuate.tween (container, 6, { scaleX: 1, scaleY: 1}).ease (Elastic.easeOut);
		**/

		/**
	 	*  O último exemplo de código centralizou nossa imagem para melhorar o comportamento da animação em escala, mas a imagem está centralizada no canto superior esquerdo da janela, em vez de ser centralizada na janela. As seguintes alterações centralizarão a imagem com base no tamanho da largura e altura do palco atual e adicionam um pequeno atraso à animação
	 	*/

		bitmap.x = - bitmap.width / 2;
		bitmap.y = - bitmap.height / 2;
		bitmap.smoothing = true;

		var container = new Sprite ();
		container.addChild (bitmap);
		container.alpha = 0;
		container.scaleX = 0;
		container.scaleY = 0;
		container.x = stage.stageWidth / 2;
		container.y = stage.stageHeight / 2;

		addChild (container);

		Actuate.tween (container, 3, { alpha: 1});
		Actuate.tween (container, 6, {scaleX: 1, scaleY: 1}).delay (0.4).ease(Elastic.easeOut);
	}
}
